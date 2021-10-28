package com.kh.spring.employee.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.spring.common.Pagination;
import com.kh.spring.common.PaginationEmp;
import com.kh.spring.employee.model.service.EmployeeService;
import com.kh.spring.employee.model.vo.Employee;
import com.kh.spring.employee.model.vo.PageInfo;


@Controller
public class EmployeeController {

	@Autowired
	private EmployeeService employeeService;
	
	
	@RequestMapping("enrollEmp.me")
	public String enrollForm() {
		return "employee/enrollEmp";
	}
	
//	@RequestMapping("listEmp.me")
//	public String listEmp() {
//		return "employee/listEmp";
//	}
	
	
	@RequestMapping("insertEmp.me")
	public String insertEmp(@ModelAttribute Employee emp, HttpSession session) {

		employeeService.insertEmployee(emp);
		
		
		session.setAttribute("msg","직원 등록 성공");
		System.out.println(emp);
		return "employee/enrollMem";
	}
	
	
	@RequestMapping("listEmp.me")
	public String selectList(@RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage, Model model) {
		/*
		 * 1.@RequestParam(value="currentPage") int currentPage -->값이 넘어오지 않았을때 에러(값을 주입할수 없어서)
		 * 2.@RequestParam(value="currentPage", required=false) int currentPage
		 * 
		 * -->required : 해당 피라미터가 필수인지 여우(true = 필수) 
		 * 따라서 required = false 로 지정하여 값을 받아줄 필요가 없다고 선언(null 이 들어올 수 있다.) 
		 * -->null 은 기본형 int 에 들어갈 수 없어서 에러가 발생한다. 
		 * 
		 * 3.@RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage)
		 * dafultValue : 넘어오는 값이 null 일 경우, 해당 피라미터의 기본 값을 지정할 수 있다.
		 * 
		 * */
		
		int listCount = employeeService.selectListCount();
		System.out.println(listCount);
		
		
		PageInfo pi = PaginationEmp.getPageInfo(listCount, currentPage, 10, 10);
		
		ArrayList<Employee> list = employeeService.selectList(pi);
		
		model.addAttribute("list", list);
		model.addAttribute("pi",pi);
		return "employee/listEmp";
		
	
	}
	
}
