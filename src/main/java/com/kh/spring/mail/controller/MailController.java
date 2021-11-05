package com.kh.spring.mail.controller;

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

import com.kh.spring.common.PaginationMail;
import com.kh.spring.common.exception.CommException;
import com.kh.spring.mail.model.service.MailService;
import com.kh.spring.mail.model.vo.Mail;
import com.kh.spring.mail.model.vo.PageInfo;
import com.kh.spring.member.model.vo.Member;

@Controller
public class MailController {
	
	@Autowired
	private MailService mailService;
	
	//메일 작성 폼 열기
	@RequestMapping("insertForm.ml")
	public String insertMailForm() {
		return "mail/mailInsertForm";
	}
	
	//메일 작성하기
	@RequestMapping("insert.ml")
	public String insertMail(Mail m, HttpServletRequest request, Model model,
			@RequestParam(name="uploadFile", required=false) MultipartFile file) {
		
		if(!file.getOriginalFilename().equals("")) {
			String changeName = saveFile(file, request);
			
			if(changeName != null) {
				m.setOriginName(file.getOriginalFilename());
				m.setChangeName(changeName);
			}
		}
		
		mailService.insertMail(m);
		
		return "redirect:sendList.ml";
		
	}
	
	//파일 저장
	private String saveFile(MultipartFile file, HttpServletRequest request) {

		String resources = request.getSession().getServletContext().getRealPath("resources");
		String savePath = resources+"\\mail_files\\";
		
		String originalName = file.getOriginalFilename();
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		
		String ext = originalName.substring(originalName.lastIndexOf("."));
		String changeName = currentTime+ext;
		
		try {
			file.transferTo(new File(savePath + changeName));
			
		} catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new CommException("file upload error");
			//에러가 났을 때 업로드를 시킬건지 말지 설계 시 결정
		}
		
		return changeName;
	}
	
	//보낸메일함 
	@RequestMapping("sendList.ml")
	public String selectSendMailList(@RequestParam(value = "currentPage", required = false, defaultValue="1") int currentPage, 
									 Model model, HttpServletRequest request) {
		
		Member mem = (Member) request.getSession().getAttribute("loginUser");
		
		int listCount = mailService.selectSendMailListCount(mem.getEmpId());
		
		PageInfo pi = PaginationMail.getPageInfo(listCount, currentPage, 10, 5);
		
		ArrayList<Mail> sendList = mailService.selectSendMailList(pi, mem.getEmpId());
		
		model.addAttribute("sendList", sendList);
		model.addAttribute("pi", pi);
		
		return "mail/sendMailListView";
	}
	
	//보낸 메일 보기
	@RequestMapping("sendDetail.ml")
	public ModelAndView selectSendMail(int mno, ModelAndView mv) {
		
		Mail m = mailService.selectSendMail(mno);
		
		mv.addObject("m", m).setViewName("mail/sendMailDetailView");
		
		return mv;
	}
	
	//받은 메일함
	@RequestMapping("receiveList.ml")
	public String selectReceiveMailList(@RequestParam(value = "currentPage", required = false, defaultValue="1") int currentPage, 
										Model model, HttpServletRequest request) {
		
		Member mem = (Member) request.getSession().getAttribute("loginUser");
		
		int listCount = mailService.selectReceiveMailListCount(mem.getEmpId());
		
		PageInfo pi = PaginationMail.getPageInfo(listCount, currentPage, 10, 5);
		
		ArrayList<Mail> receiveList = mailService.selectReceiveMailList(pi, mem.getEmpId());
		
		model.addAttribute("receiveList", receiveList);
		model.addAttribute("pi", pi);
		
		return "mail/receiveMailListView";
	}
	
	//받은 메일 보기
	@RequestMapping("receiveDetail.ml")
	public ModelAndView selectReceiveMail(int mno, ModelAndView mv) {
		
		//조회수 올려서 읽음처리하기
		Mail m = mailService.selectReceiveMail(mno);
		
		mv.addObject("m", m).setViewName("mail/receiveMailDetailView");
		
		return mv;
	}
	
	//받은메일에서 휴지통으로
	@RequestMapping("wasteCheckedReceiveMail.ml")
	public ModelAndView wasteReceiveMail(ModelAndView mv, HttpServletRequest request,
										@RequestParam(name="checkList") String checkList ) {
		
		System.out.println(checkList);
		String[] list = checkList.split(",");
		
		System.out.println(list);
		
		
		if(list != null) {
			for(int i = 0; i < list.length; i++) {
				
				mailService.wasteReceiveMail(Integer.parseInt(list[i]));
				
			}
		}
		
		mv.setViewName("redirect:receiveList.ml");
		
		return mv;
		
	}
	
	//보낸메일보기->메일다시보내기
	@RequestMapping("resend.ml")
	public String resendMail(@RequestParam(name="mno") int mno) {
		
		//보낸메일 가져오기
		Mail m = mailService.selectSendMail(mno);
		System.out.println("보낸메일다시보내기 ~~ " + m);
		
		//아이디 가져오기
		Member id =  mailService.getReceiver(m.getReceiver());
		
		m.setTitle("[재전송] "+m.getTitle());
		m.setReceiver(id.getEmpId());
		//m.setReceiver(id);
		
		mailService.resendMail(m);
		
		return "redirect:sendList.ml";
	}
	
	//휴지통
	@RequestMapping("waste.ml")
	public String selectWasteMailList() {
		return "mail/wasteMailListView";
	}
	

	
}
