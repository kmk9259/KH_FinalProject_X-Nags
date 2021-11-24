package com.kh.spring.community.controller.board;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.GsonBuilder;
import com.kh.spring.common.Pagination;
import com.kh.spring.common.exception.CommException;
import com.kh.spring.community.model.service.board.BoardService;
import com.kh.spring.community.model.vo.Board;
import com.kh.spring.community.model.vo.Board_Reply;
import com.kh.spring.community.model.vo.PageInfo;

@Controller
public class BoardController {

	@Autowired
	private BoardService boardService;

	@RequestMapping("list.bo")
	public String selectList(@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage,
			Model model) {
		int listCount = boardService.selectListCount();
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		ArrayList<Board> list = boardService.selectList(pi);		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		return "board/boardListView";
	}

	@RequestMapping("enrollForm.bo")
	public String enrollForm() {
		return "board/boardEnrollForm";
	}

	@RequestMapping("insert.bo")
	public String insertBoard(Board b, HttpServletRequest request,
			@RequestParam(name = "uploadFile", required = false) MultipartFile file) {
		if (!file.getOriginalFilename().equals("")) {
			String changeName = saveFile(file, request);
			if (changeName != null) {
				b.setOriginFile(file.getOriginalFilename());
				b.setChangeFile(changeName);
			}
		}
		boardService.insertBoard(b);
		return "redirect:list.bo";
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

	@RequestMapping("detail.bo")
	public ModelAndView selectBoard(int bno, ModelAndView mv) {
		Board b = boardService.selectBoard(bno);
		mv.addObject("b", b).setViewName("board/boardDetailView");
		return mv;
	}

	@RequestMapping("delete.bo")
	public String deleteBoard(int bno, String fileName, HttpServletRequest request) {
		boardService.deleteBoard(bno);
		if (!fileName.equals("")) {
			deleteFile(fileName, request);
		}
		return "redirect:list.bo";
	}

	private void deleteFile(String fileName, HttpServletRequest request) {
		String resources = request.getSession().getServletContext().getRealPath("resources");
		String savePath = resources + "\\upload_files\\";
		File deleteFile = new File(savePath + fileName);
		deleteFile.delete();

	}

	@RequestMapping("updateForm.bo")
	public ModelAndView updateForm(int bno, ModelAndView mv) {
		mv.addObject("b", boardService.selectBoard(bno)).setViewName("board/boardUpdateForm");
		return mv;
	}

	@RequestMapping("update.bo")
	public ModelAndView updateBoard(Board b, ModelAndView mv, HttpServletRequest request,
			@RequestParam(name = "reUploadFile", required = false) MultipartFile file) {
		if (!file.getOriginalFilename().equals("")) {
			if (b.getChangeFile() != null) {
				deleteFile(b.getChangeFile(), request);
			}
			String changeName = saveFile(file, request);
			b.setOriginFile(file.getOriginalFilename());
			b.setChangeFile(changeName);
		}
		boardService.updateBoard(b);
		mv.addObject("bno", b.getBoardNo()).setViewName("redirect:detail.bo");
		return mv;
	}
}