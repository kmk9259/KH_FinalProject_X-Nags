package com.kh.spring.employee.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.spring.common.exception.CommException;
import com.kh.spring.employee.model.service.EmployeeService;
import com.kh.spring.employee.model.vo.Employee;
import com.kh.spring.member.model.service.MemberService;
import com.kh.spring.member.model.vo.Member;

@Controller
public class EmployeeController {

	@Autowired
	private EmployeeService employeeService;
	
	
	 @Autowired private MemberService memberService;
	 
	
	@Autowired 
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@RequestMapping("enrollEmp.me")
	public String enrollForm() {
		return "employee/enrollEmp";
	}
	
	@RequestMapping("insertEmp.me")
	public String insertEmp(@ModelAttribute Employee emp, HttpSession session) {
		
	
		
	
		employeeService.insertEmployee(emp);
		
		
		session.setAttribute("msg","직원 등록 성공");
		System.out.println(emp);
		return "employee/enrollMem";
	}
	

	private String saveFile(MultipartFile file, HttpServletRequest request) {

		String resources = request.getSession().getServletContext().getRealPath("resources");
		String savePath = resources+"\\profile_files\\";
		
		System.out.println("savePath : " + savePath);
		
		String originName = file.getOriginalFilename();
		
		String currentTime = new SimpleDateFormat("yyyMMddHHmmss").format(new Date());
		
		String ext = originName.substring(originName.lastIndexOf("."));
		
		String changeName = currentTime + ext;
		
		try {
			file.transferTo(new File(savePath + changeName));
		} catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new CommException("file upload error");
		}
		
		return changeName;
	}
	

	
	
	@RequestMapping("insertMember.me")
	public String insertMember(@ModelAttribute Member m, @RequestParam("post") String post,
														 @RequestParam("address1") String address1,
														 @RequestParam("address2") String address2,
														 HttpSession session,
														 HttpServletRequest request, Model model,
														 @RequestParam(name="uploadFile", required=false) MultipartFile file) {
		
		
		System.out.println(m);
		System.out.println(file.getOriginalFilename());
		
		if(!file.getOriginalFilename().equals("")) {
			
			String changeName = saveFile(file, request);
			
			if(changeName != null) {
			m.setOriginName(file.getOriginalFilename());
			m.setChangeName(changeName);
			}
		}
		
		
		
		m.setAddress(post+"/"+address1+"/"+address2);
		//솔팅기법
		System.out.println("암호화전 : "+m.getUserPwd());
		String encPwd = bCryptPasswordEncoder.encode(m.getUserPwd());
		System.out.println("암호화후 : "+encPwd);
		m.setUserPwd(encPwd);
		memberService.insertMember(m);
		System.out.println(m);
		
		session.setAttribute("msg", "회원가입 성공");
		return "employee/listEmp";
		
	}
	
	
}
