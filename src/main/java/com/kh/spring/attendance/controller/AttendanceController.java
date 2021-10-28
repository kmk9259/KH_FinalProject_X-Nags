package com.kh.spring.attendance.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.spring.attendance.model.service.AttendanceService;
import com.kh.spring.attendance.model.vo.AttStatus;

@Controller
public class AttendanceController {
	@Autowired 
	private AttendanceService attendanceService;
  
	@RequestMapping("attendanceMy.att")
	public String myAttendance() {
		return "attendance/attendanceMy";
	}
	@RequestMapping("attendanceDay.att")
	public String DayAttendance(Model model) {
		ArrayList<AttStatus> attList = attendanceService.selectAttStatus();
		
		System.out.println("attList : " + attList);
		model.addAttribute("attList",attList);
		
		return "attendance/attendanceDay";
	}
	@RequestMapping("attendanceMonth.att")
	public String monthAttendance() {
		return "attendance/attendanceMonth";
	}
}
