package com.kh.spring.schedule.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.w3c.dom.events.Event;

import com.kh.spring.employee.model.vo.Employee;
import com.kh.spring.member.model.vo.Member;
import com.kh.spring.schedule.model.service.ScheduleService;
import com.kh.spring.schedule.model.vo.Schedule;


@Controller
public class ScheduleController {
	@Autowired 
	private ScheduleService scheduleService;
	
	//리사이즈, 드롭(드래그)
	
	 
	@RequestMapping("data.json")
	  public String create(@RequestBody Event event) {
	    // 생략
	    return "schedule/scheduleMain";
	  }
	 
//	 
//	@ResponseBody
//	@RequestMapping("main.sc")
//	public String scheduleMain(Model m, HttpServletRequest request) {
//		Member mem = (Member) request.getSession().getAttribute("loginUser");
//		Employee emp = (Employee) scheduleService.selectEmployee(mem);
//		m.addAttribute("mem", mem);
//		m.addAttribute("emp", emp);
//		System.out.println("emp : " + emp);
//		return "schedule/scheduleMain";
//	}
//	
	//일정등록
	@ResponseBody
	@RequestMapping(value = "insert.sc")
	public String insertSchedule(Schedule sc) {
		int result = scheduleService.insertSchedule(sc);
		
		return String.valueOf(result);
	}
	
//	//일정수정
//	@ResponseBody
//	@RequestMapping(value = "update.sc")
//	public String updateSchedule(Schedule sc) {
//		int result = scheduleService.updateSchedule(sc);
//		
//		return String.valueOf(result);
//	}
//	
//	//일정삭제
//	@ResponseBody
//	@RequestMapping(value = "delete.sc")
//	public String deleteSchedule(Schedule sc) {
//		int result = scheduleService.deleteSchedule(sc);
//		
//		return String.valueOf(result);
//	}
//	
	
	
}
