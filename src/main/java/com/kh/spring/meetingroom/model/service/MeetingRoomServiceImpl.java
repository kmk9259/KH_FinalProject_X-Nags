package com.kh.spring.meetingroom.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.meetingroom.model.dao.MeetingRoomDao;
import com.kh.spring.meetingroom.model.vo.Mrooms;

@Service
public class MeetingRoomServiceImpl implements MeetingRoomService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private MeetingRoomDao meetingRoomDao;
	
	@Override
	public ArrayList<Mrooms> selectRooms() {
		// TODO Auto-generated method stub
		return meetingRoomDao.selectRooms(sqlSession);
	}

}
