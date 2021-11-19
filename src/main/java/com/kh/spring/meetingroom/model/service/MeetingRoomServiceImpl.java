package com.kh.spring.meetingroom.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.meetingroom.model.dao.MeetingRoomDao;
import com.kh.spring.meetingroom.model.vo.TimeTable_A;
import com.kh.spring.meetingroom.model.vo.TimeTable_B;
import com.kh.spring.meetingroom.model.vo.TimeTable_C;
import com.kh.spring.meetingroom.model.vo.TimeTable_D;

@Service
public class MeetingRoomServiceImpl implements MeetingRoomService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private MeetingRoomDao meetingRoomDao;

	@Override
	public ArrayList<TimeTable_A> selectTimeTableA() {
		// TODO Auto-generated method stub
		return meetingRoomDao.selectTimeTableA(sqlSession);
	}

	@Override
	public ArrayList<TimeTable_B> selectTimeTableB() {
		// TODO Auto-generated method stub
		return meetingRoomDao.selectTimeTableB(sqlSession);
	}

	@Override
	public ArrayList<TimeTable_C> selectTimeTableC() {
		// TODO Auto-generated method stub
		return meetingRoomDao.selectTimeTableC(sqlSession);
	}

	@Override
	public ArrayList<TimeTable_D> selectTimeTableD() {
		// TODO Auto-generated method stub
		return meetingRoomDao.selectTimeTableD(sqlSession);
	}
	
	

}
