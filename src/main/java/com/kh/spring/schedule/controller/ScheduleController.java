package com.kh.spring.schedule.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.spring.member.model.service.MemberService;

@SessionAttributes("loginUser")
@Controller
public class ScheduleController {
	@Autowired 
	private MemberService ScheduleService;

	
	@RequestMapping("scheduleMain.jsp")
	public String checkPwd1() {
		return "schedule/scheduleMain";
	}
}
