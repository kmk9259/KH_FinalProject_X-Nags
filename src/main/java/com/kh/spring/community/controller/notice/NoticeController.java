package com.kh.spring.community.controller.notice;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.spring.common.Pagination;
import com.kh.spring.common.exception.CommException;
import com.kh.spring.community.model.service.notice.NoticeService;
import com.kh.spring.community.model.vo.Notice;
import com.kh.spring.community.model.vo.PageInfo;

@Controller
public class NoticeController {

	@Autowired
	private NoticeService noticeService;

	@RequestMapping("notice.bo")
	public String selectList(@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage,
			Model model) {			
		int listCount = noticeService.selectListCount();
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		ArrayList<Notice> list = noticeService.selectList(pi);
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);		
		return "notice/noticeListView";
	}

	@RequestMapping("noticedetail.bo")
	public ModelAndView selectBoard(int bno, ModelAndView mv) {
		Notice n = noticeService.selectNotice(bno);
		mv.addObject("n", n).setViewName("notice/noticeDetailView");
		return mv;
	}

	@RequestMapping("noticeEnrollForm.bo")
	public String noticeEnrollForm() {
		return "notice/noticeEnrollForm";
	}

	@RequestMapping("noticeInsert.bo")
	public String insertBoard(Notice n, HttpServletRequest request,
			@RequestParam(name = "uploadFile", required = false) MultipartFile file) {
		if (!file.getOriginalFilename().equals("")) {
			String changeName = saveFile(file, request);
			if (changeName != null) {
				n.setOriginFile(file.getOriginalFilename());
				n.setChangeFile(changeName);
			}
		}
		noticeService.insertNotice(n);
		return "redirect:notice.bo";
	}

	@RequestMapping("noticeUpdateForm.bo")
	public ModelAndView noticeupdateForm(int bno, ModelAndView mv) {
		mv.addObject("n", noticeService.selectNotice(bno)).setViewName("notice/noticeUpdateForm");
		return mv;
	}

	@RequestMapping("noticeUpdate.bo")
	public ModelAndView updateBoard(Notice n, ModelAndView mv, HttpServletRequest request,
			@RequestParam(name = "reUploadFile", required = false) MultipartFile file) {		
		if (!file.getOriginalFilename().equals("")) {
			if (n.getChangeFile() != null) {
				deleteFile(n.getChangeFile(), request);
			}
			String changeName = saveFile(file, request);
			n.setOriginFile(file.getOriginalFilename());
			n.setChangeFile(changeName);
		}
		noticeService.updateNotice(n);
		mv.addObject("bno", n.getNoticeNo()).setViewName("redirect:noticedetail.bo");
		return mv;
	}

	@RequestMapping("noticeDelete.bo")
	public String deleteBoard(int bno, String fileName, HttpServletRequest request) {
		noticeService.deleteNotice(bno);
		if (!fileName.equals("")) {
			deleteFile(fileName, request);
		}
		return "redirect:notice.bo";
	}

	private void deleteFile(String fileName, HttpServletRequest request) {
		String resources = request.getSession().getServletContext().getRealPath("resources");
		String savePath = resources + "\\upload_files\\";
		File deleteFile = new File(savePath + fileName);
		deleteFile.delete();
	}

	private String saveFile(MultipartFile file, HttpServletRequest request) {
		String resources = request.getSession().getServletContext().getRealPath("resources");
		String savePath = resources + "\\upload_files\\";
		String originName = file.getOriginalFilename();
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		String ext = originName.substring(originName.lastIndexOf("."));
		String changeName = currentTime + ext;
		try {
			file.transferTo(new File(savePath + changeName));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
			throw new CommException("File Upload Error");
		}
		return changeName;
	}		
	
}
