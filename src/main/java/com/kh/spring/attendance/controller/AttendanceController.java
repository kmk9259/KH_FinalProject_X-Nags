package com.kh.spring.attendance.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.GsonBuilder;
import com.kh.spring.attendance.model.service.AttendanceService;
import com.kh.spring.attendance.model.vo.AttStatus;
import com.kh.spring.attendance.model.vo.Attendance;
import com.kh.spring.employee.model.service.EmployeeService;
import com.kh.spring.employee.model.vo.Employee;
import com.kh.spring.member.model.vo.Member;

@Controller
public class AttendanceController {
	@Autowired 
	private AttendanceService attendanceService;
	
	@Autowired 
	private EmployeeService employeeService;
  
	@RequestMapping("attendanceMy.att")
	public String myAttendance(Model m, HttpServletRequest request) {
		Member mem = (Member) request.getSession().getAttribute("loginUser");
		ArrayList<Attendance> attMyList = attendanceService.selectAttMy(mem);
		
		System.out.println("attMyList :   "+attMyList);
		m.addAttribute("attMyList",attMyList);
		return "attendance/attendanceMy";
	}
	@RequestMapping("attendanceDay.att")
	public String DayAttendance(Model model,HttpServletRequest request) {
		ArrayList<AttStatus> attList = attendanceService.selectAttStatus();
		Member m = (Member) request.getSession().getAttribute("loginUser");		
		Employee loginEmp = employeeService.loginEmployee(m);
		
		model.addAttribute("attList",attList);
		model.addAttribute("loginEmp",loginEmp);
		
		return "attendance/attendanceDay";
	}
	@RequestMapping("attendanceMonth.att")
	public String monthAttendance(Model model,HttpServletRequest request) {
		ArrayList<AttStatus> attList = attendanceService.selectAttStatus();
		Member m = (Member) request.getSession().getAttribute("loginUser");		
		Employee loginEmp = employeeService.loginEmployee(m);
		
		model.addAttribute("attList",attList);
		model.addAttribute("loginEmp",loginEmp);		
		return "attendance/attendanceMonth";
	}
	
	@ResponseBody 
	@RequestMapping(value="attTime.att", produces = "application/json; charset=utf-8")
	public String selectIntime(Employee emp) {
		Attendance att = attendanceService.selectTime(emp);
		
		if(att==null) {
			attendanceService.insertIntime(emp);
			att = attendanceService.selectTime(emp);			
			return new GsonBuilder().setDateFormat("yyyy년 MM월 dd일  HH시 mm분 ss초").create().toJson(att);			
		}else {
			att = attendanceService.selectTime(emp);
			System.out.println("att : "+att);
			return new GsonBuilder().setDateFormat("yyyy년 MM월 dd일   HH시 mm분 ss초").create().toJson(att);
		}		
	}

	@ResponseBody
	@RequestMapping(value="selectAttDay.att", produces = "application/json; charset=utf-8")
	public String selectAttDay(Attendance att) {
		
		ArrayList<Employee> attlist = attendanceService.selectAttDay(att);
			
		return new GsonBuilder().setDateFormat("yyyy년 MM월 dd일 HH:mm:ss").create().toJson(attlist);
	}
	
	@ResponseBody
	@RequestMapping(value="selectAttMonth.att", produces = "application/json; charset=utf-8")
	public String selectAttMonth(Attendance att) {
		System.out.println("monthAtt : "+att);
		ArrayList<Employee> attlist = attendanceService.selectAttMonth(att);
			
		return new GsonBuilder().setDateFormat("yyyy년 MM월 dd일 HH:mm:ss").create().toJson(attlist);
	}
}
