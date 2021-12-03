package com.kh.spring.meetingroom.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.spring.meetingroom.model.service.MeetingRoomService;
import com.kh.spring.meetingroom.model.vo.MeetingRoom;
import com.kh.spring.meetingroom.model.vo.TimeTable_A;
import com.kh.spring.meetingroom.model.vo.TimeTable_B;
import com.kh.spring.meetingroom.model.vo.TimeTable_C;
import com.kh.spring.meetingroom.model.vo.TimeTable_D;
import com.kh.spring.supplies.model.vo.Return;


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
	
	//회의실 1
	@RequestMapping("insertMeetingA.me")
	public String insertMeetingA(@RequestParam("empId") String empId, MeetingRoom mr,
								 HttpServletRequest request,
								 Model model) {
		
		meetingRoomService.insertMeetingA(mr);
		
		ArrayList<MeetingRoom> mroom = meetingRoomService.reservedMeeting(empId);
		model.addAttribute("mroom", mroom);
		
		
		return "member/myPage";
		
	}
	
	//회의실 2
	@RequestMapping("insertMeetingB.me")
	public String insertMeetingB(@RequestParam("empId") String empId, MeetingRoom mr,
								 HttpServletRequest request,
								 Model model) {
		
		meetingRoomService.insertMeetingB(mr);
		
		ArrayList<MeetingRoom> mroom = meetingRoomService.reservedMeeting(empId);
		
		model.addAttribute("mroom", mroom);
		
		return "member/myPage";
		
	}
	
	//회의실 3
	@RequestMapping("insertMeetingC.me")
	public String insertMeetingC(@RequestParam("empId") String empId, MeetingRoom mr,
								 HttpServletRequest request,
								 Model model) {
		
		meetingRoomService.insertMeetingC(mr);
	
		ArrayList<MeetingRoom> mroom = meetingRoomService.reservedMeeting(empId);
		model.addAttribute("mroom", mroom);
		
		return "member/myPage";
		
	}
	
	//회의실 4
	@RequestMapping("insertMeetingD.me")
	public String insertMeetingD(@RequestParam("empId") String empId, MeetingRoom mr,
								 HttpServletRequest request,
								 Model model) {
		
		meetingRoomService.insertMeetingD(mr);	
		
		ArrayList<MeetingRoom> mroom = meetingRoomService.reservedMeeting(empId);
		model.addAttribute("mroom", mroom);
		
		return "member/myPage";
		
	}
	
	@RequestMapping("meetingDetail.me")
	public String meetingDetail(@RequestParam("empId") String empId, MeetingRoom mr,
			 					HttpServletRequest request,
			 					Model model) {
		
		ArrayList<MeetingRoom> mroom = meetingRoomService.meetingDetail(empId);
		model.addAttribute("mroom", mroom);

		return "meetingRoom/updateMeeting";
	}
	
	//회의실 1 삭제
	@RequestMapping("cancelMeetingA.ca")
	public String cancelMeetingA(@RequestParam("empId") String empId, MeetingRoom mr, HttpServletRequest request, Model model) {
		
		meetingRoomService.cancelMeetingA(mr);
		
		ArrayList<MeetingRoom> mroom = meetingRoomService.reservedMeeting(empId);
		model.addAttribute("mroom", mroom);
		
		return "member/myPage";
		
	}
	
	//회의실 2 삭제
	@RequestMapping("cancelMeetingB.ca")
	public String cancelMeetingB(@RequestParam("empId") String empId, MeetingRoom mr, HttpServletRequest request, Model model) {
		
		meetingRoomService.cancelMeetingB(mr);
		
		ArrayList<MeetingRoom> mroom = meetingRoomService.reservedMeeting(empId);
		model.addAttribute("mroom", mroom);
		
		return "member/myPage";
		
	}
	
	//회의실 3 삭제
	@RequestMapping("cancelMeetingC.ca")
	public String cancelMeetingC(@RequestParam("empId") String empId, MeetingRoom mr, HttpServletRequest request, Model model) {
		
		meetingRoomService.cancelMeetingC(mr);
		
		ArrayList<MeetingRoom> mroom = meetingRoomService.reservedMeeting(empId);
		model.addAttribute("mroom", mroom);
		
		
		return "member/myPage";
		
	}
	
	//회의실 4 삭제
	@RequestMapping("cancelMeetingD.ca")
	public String cancelMeetingD(@RequestParam("empId") String empId, MeetingRoom mr, HttpServletRequest request, Model model) {
		
		meetingRoomService.cancelMeetingD(mr);
		
		ArrayList<MeetingRoom> mroom = meetingRoomService.reservedMeeting(empId);
		model.addAttribute("mroom", mroom);
		
		return "member/myPage";
		
	}
	
	
	//관리자 초기화 회의시 
	@RequestMapping("reset.me")
	public String resetA(TimeTable_A a, TimeTable_B b, TimeTable_C c, TimeTable_D d,
						 MeetingRoom mroom, HttpServletRequest request, Model model) {
		
		
		ArrayList<TimeTable_A> TimeTableA = meetingRoomService.selectTimeTableA();
		ArrayList<TimeTable_B> TimeTableB = meetingRoomService.selectTimeTableB();
		ArrayList<TimeTable_C> TimeTableC = meetingRoomService.selectTimeTableC();
		ArrayList<TimeTable_D> TimeTableD = meetingRoomService.selectTimeTableD();

		model.addAttribute("TimeTableA", TimeTableA);
		model.addAttribute("TimeTableB", TimeTableB);
		model.addAttribute("TimeTableC", TimeTableC);
		model.addAttribute("TimeTableD", TimeTableD);
		
		
		meetingRoomService.resetAll(mroom);
		meetingRoomService.reset(a);
		meetingRoomService.reset(b);
		meetingRoomService.reset(c);
		meetingRoomService.reset(d);
		
		
		return "redirect:meetingRoom.me";
		
	}
	
	
	
	
}
