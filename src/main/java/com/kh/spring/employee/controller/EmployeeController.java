package com.kh.spring.employee.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.spring.employee.model.service.EmployeeService;
import com.kh.spring.employee.model.vo.Employee;
import com.kh.spring.member.model.service.MemberService;
import com.kh.spring.member.model.vo.Member;

@Controller
public class EmployeeController {

	@Autowired
	private EmployeeService employeeService;
	
	/*
	 * @Autowired private MemberService memberService;
	 */
	
//	@Autowired 
//	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@RequestMapping("enrollEmp.me")
	public String enrollForm() {
		return "employee/enrollEmp";
	}
	
	@RequestMapping("insertEmp.me")
	public String insertEmp(@ModelAttribute Employee emp, HttpSession session) {
		

	
		try {
			
			employeeService.insertEmployee(emp);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		session.setAttribute("msg","회원가입 성공");
		System.out.println(emp);
		return "employee/enrollEmp";
	}
	
	
	
}
