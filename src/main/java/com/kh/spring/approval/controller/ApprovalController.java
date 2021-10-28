package com.kh.spring.approval.controller;

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

import com.kh.spring.approval.model.service.ApprovalService;
import com.kh.spring.approval.model.vo.Approval;
import com.kh.spring.common.exception.CommException;

@Controller
public class ApprovalController {

	@Autowired
	private ApprovalService approvalService;
	
	//증명서 신청 작성 폼 열기
	@RequestMapping("certificateForm.ap")
	public String requestCertificateForm() {
		return "approval/requestCertificateForm";
	}
	
	//휴가 신청 작성 폼 열기
	@RequestMapping("holidayForm.ap")
	public String requestHolidayForm() {
		return "approval/requestHolidayForm";
	}
	
	//연장근무 신청 작성 폼 열기
	@RequestMapping("overtimeForm.ap")
	public String requestOvertimeForm() {
		return "approval/requestOvertimeForm";
	}
	
	@RequestMapping("insert.ap")
	public String insertApproval(Approval app, HttpServletRequest request, Model model,
			@RequestParam(name="uploadFile", required=false) MultipartFile file) {
		
		if(!file.getOriginalFilename().equals("")) {
			String changeName = saveFile(file, request);
			
			if(changeName != null) {
				app.setOriginName(file.getOriginalFilename());
				app.setChangeName(changeName);
			}
		}
		
		approvalService.insertApproval(app);
		
		return "main";
		//나중에 진행중 결재함으로 경로 바꾸기
	}

	//파일 저장
		private String saveFile(MultipartFile file, HttpServletRequest request) {

			String resources = request.getSession().getServletContext().getRealPath("resources");
			String savePath = resources+"\\approval_files\\";
			
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
}
