package com.kh.spring.employee.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.spring.employee.model.service.EmployeeService;
import com.kh.spring.employee.model.vo.Employee;


@Controller
public class EmployeeController {

	@Autowired
	private EmployeeService employeeService;
	
	
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
	

	
	

	
	
	
	
	
}
