package com.kh.spring.meetingroom.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.common.exception.CommException;
import com.kh.spring.meetingroom.model.dao.MeetingRoomDao;
import com.kh.spring.meetingroom.model.vo.MeetingRoom;
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

	@Override
	public void insertMeetingA(MeetingRoom mr) {
		int result = meetingRoomDao.insertMeetingA(sqlSession, mr);
		
		if(result > 0) {
			String[] times = mr.getTime().split(",");
			
			for(int i=0; i<times.length; i++) {
				String time = mr.getTime();
				time += times[i];
				
				System.out.println("나눠 들어오나? " + time);
				
				int mrNo = mr.getMrNo();
				//int mroomNo = mr.getMroomNo();
				//String tm = mr.getTime();
				String status = mr.getStatus();
				
				ArrayList<MeetingRoom> mrList = new ArrayList<MeetingRoom>();
				
				MeetingRoom mroom = new MeetingRoom(mrNo, times[i], status);
				
				mrList.add(mroom);
				
				System.out.println("미팅룸 어레이 리스트 잘? "+  mrList);
				
				mrList = meetingRoomDao.updateStatus(sqlSession, mrList);
				
			
			}
		}
		
		if(result < 0) {
			throw new CommException("회의실 예약 실패");
		}
		
	}
	
	

}
