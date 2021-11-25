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
		
		return (ArrayList)sqlSession.selectList("mRoomsMapper.selectTimeTableA");
	}

	public ArrayList<TimeTable_B> selectTimeTableB(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("mRoomsMapper.selectTimeTableB");
	}

	public ArrayList<TimeTable_C> selectTimeTableC(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("mRoomsMapper.selectTimeTableC");
	}

	public ArrayList<TimeTable_D> selectTimeTableD(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("mRoomsMapper.selectTimeTableD");
	}
	
	
	//회의실 1
	public int insertMeetingA(SqlSessionTemplate sqlSession, MeetingRoom mr) {
		
		return sqlSession.insert("mRoomsMapper.insertMeetingA", mr);
	}

	//회의실 1
	public int updateStatus(SqlSessionTemplate sqlSession, String time) {
		return sqlSession.update("mRoomsMapper.updateStatusA", time);
		
	}

	//회의실 2
	public int insertMeetingB(SqlSessionTemplate sqlSession, MeetingRoom mr) {
		
		return sqlSession.insert("mRoomsMapper.insertMeetingB", mr);
	}

	//회의실 2
	public int updateStatusB(SqlSessionTemplate sqlSession, String time) {
		return sqlSession.update("mRoomsMapper.updateStatusB", time);
		
	}

	//회의실 3
	public int insertMeetingC(SqlSessionTemplate sqlSession, MeetingRoom mr) {
		
		return sqlSession.insert("mRoomsMapper.insertMeetingC", mr);
	}

	//회의실 3
	public int updateStatusC(SqlSessionTemplate sqlSession, String time) {
		return sqlSession.update("mRoomsMapper.updateStatusC", time);
		
	}

	//회의실 4
	public int insertMeetingD(SqlSessionTemplate sqlSession, MeetingRoom mr) {
		
		return sqlSession.insert("mRoomsMapper.insertMeetingD", mr);
	}

	//회의실 4
	public int updateStatusD(SqlSessionTemplate sqlSession, String time) {
		return sqlSession.update("mRoomsMapper.updateStatusD", time);
		
	}

	public ArrayList<MeetingRoom> reservedMeeting(SqlSessionTemplate sqlSession, String empId) {
		
		return (ArrayList)sqlSession.selectList("mRoomsMapper.reservedMeeting", empId);
	}


	public ArrayList<MeetingRoom> meetingDetail(SqlSessionTemplate sqlSession, String empId) {
		return (ArrayList)sqlSession.selectList("mRoomsMapper.meetingDetail", empId);
	}

	//통합 테이블에서 N,Y
	public int cancelMeeting(SqlSessionTemplate sqlSession, int mroomNo) {
		
		return sqlSession.delete("mRoomsMapper.cancelMeeting", mroomNo);
	}
	
	//회의실 1 reset
	public int cancelMeetingA(SqlSessionTemplate sqlSession, String time) {
		
		return sqlSession.update("mRoomsMapper.cancelMeetingA", time);
		
	}


	//회의실 2 reset
	public int cancelMeetingB(SqlSessionTemplate sqlSession, String time) {
		return sqlSession.update("mRoomsMapper.cancelMeetingB", time);
		
	}

	//회의실 3 reset
	public int cancelMeetingC(SqlSessionTemplate sqlSession, String time) {
		return sqlSession.update("mRoomsMapper.cancelMeetingC", time);
		
	}

	//회의실 4 reset
	public int cancelMeetingD(SqlSessionTemplate sqlSession, String time) {
		return sqlSession.update("mRoomsMapper.cancelMeetingD", time);
		
	}

//	public int resetA(SqlSessionTemplate sqlSession, TimeTable_A a) {
//		
//		return sqlSession.update("mRoomsMapper.resetA", a);
//	}

	public int resetAll(SqlSessionTemplate sqlSession, MeetingRoom mroom) {
		// TODO Auto-generated method stub
		return sqlSession.update("mRoomsMapper.resetAll", mroom);
	}

	public int reset(SqlSessionTemplate sqlSession, TimeTable_A a) {
		
		return sqlSession.update("mRoomsMapper.resetA", a);
	}

	public int reset(SqlSessionTemplate sqlSession, TimeTable_B b) {
		
		return sqlSession.update("mRoomsMapper.resetB", b);
	}

	public int reset(SqlSessionTemplate sqlSession, TimeTable_C c) {
		
		return sqlSession.update("mRoomsMapper.resetC", c);
	}

	public int reset(SqlSessionTemplate sqlSession, TimeTable_D d) {
		
		return sqlSession.update("mRoomsMapper.resetD", d);
	}







}
