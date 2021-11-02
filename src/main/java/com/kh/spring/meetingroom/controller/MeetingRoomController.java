package com.kh.spring.meetingroom.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.spring.meetingroom.model.service.MeetingRoomService;
import com.kh.spring.meetingroom.model.vo.Mrooms;

@Controller
public class MeetingRoomController {

	@Autowired
	private MeetingRoomService meetingRoomService;
	
	@RequestMapping("meetingRoom.me")
	public String meetingRoom(Model model) {
		
		ArrayList<Mrooms> mrooms =  meetingRoomService.selectRooms();
		
		model.addAttribute("mrooms", mrooms);
		
		return "meetingRoom/meetingRoom";
	}
	
}
