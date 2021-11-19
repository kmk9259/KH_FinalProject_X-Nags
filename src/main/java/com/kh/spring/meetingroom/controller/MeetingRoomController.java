package com.kh.spring.meetingroom.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.spring.meetingroom.model.service.MeetingRoomService;
import com.kh.spring.meetingroom.model.vo.Mrooms;
import com.kh.spring.meetingroom.model.vo.TimeTable_A;
import com.kh.spring.meetingroom.model.vo.TimeTable_B;
import com.kh.spring.meetingroom.model.vo.TimeTable_C;
import com.kh.spring.meetingroom.model.vo.TimeTable_D;


@Controller
public class MeetingRoomController {

	@Autowired
	private MeetingRoomService meetingRoomService;
	
	@RequestMapping("meetingRoom.me")
	public String meetingRoom(Model model) {
		
		ArrayList<TimeTable_A> TimeTableA = meetingRoomService.selectTimeTableA();
		ArrayList<TimeTable_B> TimeTableB = meetingRoomService.selectTimeTableB();
		ArrayList<TimeTable_C> TimeTableC = meetingRoomService.selectTimeTableC();
		ArrayList<TimeTable_D> TimeTableD = meetingRoomService.selectTimeTableD();
		
		
		
		model.addAttribute("TimeTableA", TimeTableA);
		model.addAttribute("TimeTableB", TimeTableB);
		model.addAttribute("TimeTableC", TimeTableC);
		model.addAttribute("TimeTableD", TimeTableD);
		
		return "meetingRoom/meetingRoom";
	}
	
}
