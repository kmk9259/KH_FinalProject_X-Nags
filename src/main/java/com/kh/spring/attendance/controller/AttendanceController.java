package com.kh.spring.attendance.controller;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.GsonBuilder;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
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
	public String DayAttendance(Model model) {
		ArrayList<AttStatus> attList = attendanceService.selectAttStatus();
		
		
		model.addAttribute("attList",attList);
		
		return "attendance/attendanceDay";
	}
	@RequestMapping("attendanceMonth.att")
	public String monthAttendance(Model model) {
		ArrayList<AttStatus> attList = attendanceService.selectAttStatus();
		
		
		model.addAttribute("attList",attList);
		return "attendance/attendanceMonth";
	}
	
	@ResponseBody
	@RequestMapping(value="attInTime.att", produces = "application/json; charset=utf-8")
	public String selectIntime(Employee emp) {
		Attendance att = attendanceService.selectIntime(emp);
		
		if(att==null) {
			attendanceService.insertIntime(emp);
			att = attendanceService.selectIntime(emp);			
			return new GsonBuilder().setDateFormat("yyyy년 MM월 dd일     HH시 mm분 ss초").create().toJson(att);			
		}else {
			att = attendanceService.selectIntime(emp);
			return new GsonBuilder().setDateFormat("yyyy년 MM월 dd일     HH시 mm분 ss초").create().toJson(att);
		}		
	}
	@ResponseBody
	@RequestMapping(value="selectAttDay.att")
	public JsonObject selectAttDay(Attendance att, String selectItem) {
		
		System.out.println("atttttttttt: "+att);
		System.out.println("selectItem : "+selectItem);
		
		ArrayList<Employee> empList = employeeService.selectAttDay(selectItem);
		ArrayList<Attendance> attList = attendanceService.selectAttDay(att);
		
//		System.out.println("empList : "+empList);
		System.out.println("attList : "+attList);
		
		
		
		//0. 두개의 리스트를 담기위한 JSONObject 생성하기
		JsonObject map = new JsonObject();
		
		//1. emp 객체 리스트만 담아오기
		JsonObject jsonEmp = null;
		JsonArray eArr = new JsonArray();
		
		//2. att 객체 리스트만 담아오기
		JsonObject jsonAtt = null;
		JsonArray aArr = new JsonArray();
		
		
		
		return null;
	}
}
