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

	//화의실 1
	@Override
	public void insertMeetingA(MeetingRoom mr) {
		int result = meetingRoomDao.insertMeetingA(sqlSession, mr);
		
		if(result > 0) {
			String[] Stime = mr.getTime().split(",");
			
			for(int i=0; i<Stime.length; i++) {
				String time = mr.getTime();
				time += Stime[i];
				meetingRoomDao.updateStatus(sqlSession, Stime[i]);
				
			
			}
		}
		
		if(result < 0) {
			throw new CommException("회의실 예약 실패");
		}
		
	}

	//회의실 2
	@Override
	public void insertMeetingB(MeetingRoom mr) {
		int result = meetingRoomDao.insertMeetingB(sqlSession, mr);
		
		if(result > 0) {
			String[] Stime = mr.getTime().split(",");
			
			for(int i=0; i<Stime.length; i++) {
				String time = mr.getTime();
				time += Stime[i];
				
				meetingRoomDao.updateStatusB(sqlSession, Stime[i]);
				
			
			}
		}
		
		if(result < 0) {
			throw new CommException("회의실 예약 실패");
		}
		
	}

	//회의실 3
	@Override
	public void insertMeetingC(MeetingRoom mr) {
		int result = meetingRoomDao.insertMeetingC(sqlSession, mr);
		
		if(result > 0) {
			String[] Stime = mr.getTime().split(",");
			
			for(int i=0; i<Stime.length; i++) {
				String time = mr.getTime();
				time += Stime[i];
				meetingRoomDao.updateStatusC(sqlSession, Stime[i]);
			}
		}
		
		if(result < 0) {
			throw new CommException("회의실 예약 실패");
		}
		
	}
	
	//회의실 4
	@Override
	public void insertMeetingD(MeetingRoom mr) {
		int result = meetingRoomDao.insertMeetingD(sqlSession, mr);
		
		if(result > 0) {
			String[] Stime = mr.getTime().split(",");
			
			for(int i=0; i<Stime.length; i++) {
				String time = mr.getTime();
				time += Stime[i];
				
				meetingRoomDao.updateStatusD(sqlSession, Stime[i]);
				
			
			}
		}
		
		if(result < 0) {
			throw new CommException("회의실 예약 실패");
		}
		
	}

	@Override
	public ArrayList<MeetingRoom> reservedMeeting(String empId) {
		
		return meetingRoomDao.reservedMeeting(sqlSession, empId);
	}

	@Override
	public ArrayList<MeetingRoom> meetingDetail(String empId) {
		
		return meetingRoomDao.meetingDetail(sqlSession, empId);
	}




	@Override
	public void cancelMeetingA(MeetingRoom mr) {
		
		int result = meetingRoomDao.cancelMeeting(sqlSession, mr.getMroomNo());
		
		System.out.println("결과? " + result);
		
		System.out.println("결과? " + mr);
		if(result > 0) {
			String[] Stime = mr.getTime().split(",");
			
			for(int i=0; i<Stime.length; i++) {
				String time = mr.getTime();
				time += Stime[i];
				
				meetingRoomDao.cancelMeetingA(sqlSession, Stime[i]);
				
			
			}
		}
		
		if(result < 0) {
			throw new CommException("회의실 예약 취소 실패");
		}
		
	}



	@Override
	public void cancelMeetingB(MeetingRoom mr) {
		
		int result = meetingRoomDao.cancelMeeting(sqlSession, mr.getMroomNo());
		
		System.out.println("결과? " + result);
		
		System.out.println("결과? " + mr);
		if(result > 0) {
			String[] Stime = mr.getTime().split(",");
			
			for(int i=0; i<Stime.length; i++) {
				String time = mr.getTime();
				time += Stime[i];
				
				meetingRoomDao.cancelMeetingB(sqlSession, Stime[i]);
				
			
			}
		}
		
		if(result < 0) {
			throw new CommException("회의실 예약 취소 실패");
		}
		
	}

	@Override
	public void cancelMeetingC(MeetingRoom mr) {
		
		int result = meetingRoomDao.cancelMeeting(sqlSession, mr.getMroomNo());
		
		System.out.println("결과? " + result);
		
		System.out.println("결과? " + mr);
		if(result > 0) {
			String[] Stime = mr.getTime().split(",");
			
			for(int i=0; i<Stime.length; i++) {
				String time = mr.getTime();
				time += Stime[i];
				
				meetingRoomDao.cancelMeetingC(sqlSession, Stime[i]);
				
			
			}
		}
		
		if(result < 0) {
			throw new CommException("회의실 예약 취소 실패");
		}
		
	}

	@Override
	public void cancelMeetingD(MeetingRoom mr) {
		
		int result = meetingRoomDao.cancelMeeting(sqlSession, mr.getMroomNo());
		
		System.out.println("결과? " + result);
		
		System.out.println("결과? " + mr);
		if(result > 0) {
			String[] Stime = mr.getTime().split(",");
			
			for(int i=0; i<Stime.length; i++) {
				String time = mr.getTime();
				time += Stime[i];
				
				meetingRoomDao.cancelMeetingD(sqlSession, Stime[i]);
				
			
			}
		}
		
		if(result < 0) {
			throw new CommException("회의실 예약 취소 실패");
		}
		
	}

//	@Override
//	public void resetA(TimeTable_A a) {
//		int result = meetingRoomDao.resetA(sqlSession, a);
//		
//		if(result < 0) {
//			throw new CommException("회의실 리셋 실패");
//		}
//		
//		
//		
//	}

	@Override
	public void resetAll(MeetingRoom mroom) {
		int result = meetingRoomDao.resetAll(sqlSession, mroom);
		
		if(result < 0) {
			throw new CommException("모든 회원 사용중 회의실 리셋 실패");
		}
		
	}

	@Override
	public void reset(TimeTable_A a) {
		int result = meetingRoomDao.reset(sqlSession, a);
		
		if(result < 0) {
			throw new CommException("회의실 A 리셋 실패");
		}
		
	}
	
	@Override
	public void reset(TimeTable_B b) {
		int result = meetingRoomDao.reset(sqlSession, b);
		
		if(result < 0) {
			throw new CommException("회의실 B 리셋 실패");
		}
		
		
	}
	
	@Override
	public void reset(TimeTable_C c) {
		int result = meetingRoomDao.reset(sqlSession, c);
		
		if(result < 0) {
			throw new CommException("회의실 C 리셋 실패");
		}
		
		
	}
	
	@Override
	public void reset(TimeTable_D d) {
		int result = meetingRoomDao.reset(sqlSession, d);
		
		if(result < 0) {
			throw new CommException("회의실 D 리셋 실패");
		}
		
		
	}
















}
