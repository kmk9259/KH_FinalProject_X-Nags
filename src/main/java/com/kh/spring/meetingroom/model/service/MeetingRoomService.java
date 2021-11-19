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

}
