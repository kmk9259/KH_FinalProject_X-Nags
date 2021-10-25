package com.kh.spring.employee.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.spring.employee.model.service.EmployeeService;

@Controller
public class EmployeeController {

//	@Autowired
//	private EmployeeService employeeService;
	
	@RequestMapping("enrollEmp.me")
	public String enrollForm() {
		return "employee/enrollEmp";
	}
	
}
