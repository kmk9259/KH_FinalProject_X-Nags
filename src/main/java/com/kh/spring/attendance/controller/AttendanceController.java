package com.kh.spring.attendance.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AttendanceController {
//	@Autowired 
//	private AttendanceService attendanceService;
  
	@RequestMapping("attendanceMy.att")
	public String myPage() {
		return "attendance/attendanceMy";
	}
}
