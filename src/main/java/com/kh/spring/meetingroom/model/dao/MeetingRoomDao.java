package com.kh.spring.meetingroom.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.meetingroom.model.vo.MeetingRoom;
import com.kh.spring.meetingroom.model.vo.TimeTable_A;
import com.kh.spring.meetingroom.model.vo.TimeTable_B;
import com.kh.spring.meetingroom.model.vo.TimeTable_C;
import com.kh.spring.meetingroom.model.vo.TimeTable_D;

@Repository
public class MeetingRoomDao {


	public ArrayList<TimeTable_A> selectTimeTableA(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("mRoomsMapper.selectTimeTableA");
	}

	public ArrayList<TimeTable_B> selectTimeTableB(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("mRoomsMapper.selectTimeTableB");
	}

	public ArrayList<TimeTable_C> selectTimeTableC(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("mRoomsMapper.selectTimeTableC");
	}

	public ArrayList<TimeTable_D> selectTimeTableD(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("mRoomsMapper.selectTimeTableD");
	}

	public int insertMeetingA(SqlSessionTemplate sqlSession, MeetingRoom mr) {
		// TODO Auto-generated method stub
		return sqlSession.insert("mRoomsMapper.insertMeetingA", mr);
	}

	public ArrayList<MeetingRoom> updateStatus(SqlSessionTemplate sqlSession, ArrayList<MeetingRoom> mrList) {
		for (MeetingRoom meetingRoom : mrList) {
			sqlSession.selectList("mRoomsMapper.updateStatus", mrList);
		}
		return mrList;
		
	}

}
