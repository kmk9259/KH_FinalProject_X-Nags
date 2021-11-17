package com.kh.spring.attendance.controller;


import java.sql.Timestamp;
import java.text.ParseException;
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
	
	//내 근태 현황 페이지
	@RequestMapping("attendanceMy.att")
	public String myAttendance(Model m, HttpServletRequest request) {
		Member mem = (Member) request.getSession().getAttribute("loginUser");
		System.out.println(mem);
		ArrayList<Attendance> attMyList = attendanceService.selectAttMy(mem);
		
		System.out.println("attMyList :   "+attMyList);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yy/mm/dd");
		for(Attendance att : attMyList) {
			
			try {
				String d = sdf.format(att.getAttDate());
				System.out.println(d);			
				att.setAttDate(sdf.parse(d));
				System.out.println(att);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		m.addAttribute("attMyList",attMyList);
		return "attendance/attendanceMy";
	}
	//일별 근태 현황 페이지 
	@RequestMapping("attendanceDay.att")
	public String DayAttendance(Model model,HttpServletRequest request) {
		ArrayList<AttStatus> attList = attendanceService.selectAttStatus();
		Member m = (Member) request.getSession().getAttribute("loginUser");		
		Employee loginEmp = employeeService.loginEmployee(m);
		
		model.addAttribute("attList",attList);
		model.addAttribute("loginEmp",loginEmp);
		
		return "attendance/attendanceDay";
	}
	//월별 근태 현황 페이지 
	@RequestMapping("attendanceMonth.att")
	public String monthAttendance(Model model,HttpServletRequest request) {
		ArrayList<AttStatus> attList = attendanceService.selectAttStatus();
		Member m = (Member) request.getSession().getAttribute("loginUser");		
		Employee loginEmp = employeeService.loginEmployee(m);
		
		model.addAttribute("attList",attList);
		model.addAttribute("loginEmp",loginEmp);		
		return "attendance/attendanceMonth";
	}
	
	//출근 시간이 찍혀있다면 select 아니면 insert
	@ResponseBody 
	@RequestMapping(value="attTime.att", produces = "application/json; charset=utf-8")
	public String selectIntime(Employee emp) {
		Attendance att = attendanceService.selectTime(emp);
		
		if(att==null) {
			attendanceService.insertIntime(emp);
			att = attendanceService.selectTime(emp);			
			return new GsonBuilder().setDateFormat("yy/MM/dd").create().toJson(att);			
		}else {
			att = attendanceService.selectTime(emp);
			System.out.println("att : "+att);
			return new GsonBuilder().setDateFormat("yy/MM/dd").create().toJson(att);
		}		
	}
	
	//일별 근태 현황 조회
	@ResponseBody
	@RequestMapping(value="selectAttDay.att", produces = "application/json; charset=utf-8")
	public String selectAttDay(Attendance att) {
		
		ArrayList<Employee> attlist = attendanceService.selectAttDay(att);
			
		return new GsonBuilder().setDateFormat("yy/MM/dd").create().toJson(attlist);
	}
	
	//월별 근태 현황 조회
	@ResponseBody
	@RequestMapping(value="selectAttMonth.att", produces = "application/json; charset=utf-8")
	public String selectAttMonth(Attendance att) {
		System.out.println("monthAtt : "+att);
		ArrayList<Employee> attlist = attendanceService.selectAttMonth(att);
			
		return new GsonBuilder().setDateFormat("yyyy년 MM월 dd일").create().toJson(attlist);
	}
	
	//일별 근태 수정 (관리자)
	@RequestMapping("updateDay.att")
	public String updateDay(@RequestParam("empId") String empId,
							@RequestParam("attNo") int attNo,
							@RequestParam("attInTime") String attInTime,
							@RequestParam("attOutTime") String attOutTime) {
		
		Employee emp = new Employee();
		emp.setEmpId(empId); 
		emp.setAttNo(attNo);
		emp.setAttInTime(attInTime); 
		emp.setAttOutTime(attOutTime);
		attendanceService.updateDay(emp); 
		
		return "redirect:attendanceDay.att";
	}
	
	//월별 근태 현황 조회
		@ResponseBody
		@RequestMapping(value="deleteDay.att")
		public String deleteDay(int attNo) {
			System.out.println("attNo : "+attNo);
			attendanceService.deleteDay(attNo);
			
			return "redirect:attendanceDay.att";
			
		}
}
