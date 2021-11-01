package com.kh.spring.meetingroom.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.spring.meetingroom.model.service.MeetingRoomService;

@Controller
public class MeetingRoomController {

//	@Autowired
//	private MeetingRoomService meetingRoomService;
	
	@RequestMapping("meetingRoom.me")
	public String meetingRoom() {
		return "meetingRoom/meetingRoom";
	}
	
}
