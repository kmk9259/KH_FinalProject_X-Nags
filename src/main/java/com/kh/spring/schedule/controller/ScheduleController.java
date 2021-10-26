package com.kh.spring.schedule.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.spring.schedule.model.service.ScheduleService;

@SessionAttributes("loginUser")
@Controller
public class ScheduleController {
//	@Autowired 
//	private ScheduleService scheduleService;

	
	@RequestMapping("main.sc")
	public String checkPwd1() {
		return "schedule/scheduleMain";
	}
}
