package com.kh.spring.schedule.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.spring.schedule.model.service.ScheduleService;
import com.kh.spring.schedule.model.vo.Schedule;


@Controller
public class ScheduleController {
	@Autowired 
	private ScheduleService scheduleService;

	
	@RequestMapping("main.sc")
	public String scheduleMain() {
		return "schedule/scheduleMain";
	}
	
	//일정등록
	@ResponseBody
	@RequestMapping(value = "insert.sc")
	public String insertSchedule(Schedule sc) {
		int result = scheduleService.insertSchedule(sc);
		
		return String.valueOf(result);
	}
	
	//일정수정
	@ResponseBody
	@RequestMapping(value = "update.sc")
	public String updateSchedule(Schedule sc) {
		int result = scheduleService.updateSchedule(sc);
		
		return String.valueOf(result);
	}
	
	//일정삭제
	@ResponseBody
	@RequestMapping(value = "delete.sc")
	public String deleteSchedule(Schedule sc) {
		int result = scheduleService.deleteSchedule(sc);
		
		return String.valueOf(result);
	}
	
	//일정선택
	@RequestMapping(value = "detail.sc")
	public String detailSchedule(Schedule sc) {
		
		
		return null;
		
	}
	
}
