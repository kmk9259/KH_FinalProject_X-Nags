package com.kh.spring.meetingroom.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.meetingroom.model.vo.Mrooms;

@Repository
public class MeetingRoomDao {

	public ArrayList<Mrooms> selectRooms(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("mRoomsMapper.selectRooms");
	}

}
