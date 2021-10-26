package com.kh.spring.mail.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.spring.common.Pagination;
import com.kh.spring.common.exception.CommException;
import com.kh.spring.mail.model.service.MailService;
import com.kh.spring.mail.model.vo.Mail;
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
		
		return "main";
		//나중에 보낸메일함으로 경로 바꾸기
		
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
	public String selectSendMailList(@RequestParam(value = "currentPage", required = false, defaultValue="1") int currentPage, Model model) {
		
		int listCount = mailService.selectSendMailListCount();
		
		
		
		return "mail/sendMailListView";
	}
	

}
