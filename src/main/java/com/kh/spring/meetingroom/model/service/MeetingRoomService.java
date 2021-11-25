package com.kh.spring.meetingroom.model.service;

import java.util.ArrayList;

import com.kh.spring.meetingroom.model.vo.MeetingRoom;
import com.kh.spring.meetingroom.model.vo.TimeTable_A;
import com.kh.spring.meetingroom.model.vo.TimeTable_B;
import com.kh.spring.meetingroom.model.vo.TimeTable_C;
import com.kh.spring.meetingroom.model.vo.TimeTable_D;

public interface MeetingRoomService {


	ArrayList<TimeTable_A> selectTimeTableA();

	ArrayList<TimeTable_B> selectTimeTableB();

	ArrayList<TimeTable_C> selectTimeTableC();

	ArrayList<TimeTable_D> selectTimeTableD();

	void insertMeetingA(MeetingRoom mr);

	void insertMeetingB(MeetingRoom mr);

	void insertMeetingC(MeetingRoom mr);

	void insertMeetingD(MeetingRoom mr);

	ArrayList<MeetingRoom> reservedMeeting(String empId);

	ArrayList<MeetingRoom> meetingDetail(String empId);

	void cancelMeetingA(MeetingRoom mr);

	void cancelMeetingB(MeetingRoom mr);

	void cancelMeetingC(MeetingRoom mr);

	void cancelMeetingD(MeetingRoom mr);

	void resetAll(MeetingRoom mroom);

	void reset(TimeTable_A a);

	void reset(TimeTable_B b);

	void reset(TimeTable_C c);

	void reset(TimeTable_D d);

}
