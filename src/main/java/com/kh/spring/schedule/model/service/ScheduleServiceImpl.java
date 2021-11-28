package com.kh.spring.schedule.model.service;

import java.util.ArrayList;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.common.exception.CommException;
import com.kh.spring.schedule.model.dao.ScheduleDao;

import com.kh.spring.schedule.model.vo.Schedule;

@Service
public class ScheduleServiceImpl implements ScheduleService {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ScheduleDao scheduleDao;

	
	@Override
	public ArrayList<Schedule> scheduleMain(Map<String, String> paramMap) {
		
		return scheduleDao.scheduleMain(sqlSession, paramMap);
	}
	
	@Override
	public int insertSchedule(Schedule sc) {
		int result = scheduleDao.insertSchedule(sqlSession, sc);
		
		if(result < 0 ) {
			throw new CommException("일정 등록에 실패하였습니다.");
		}
		
		return result;
	}
	
	@Override
	public int updateSchedule(Schedule sc) {
		int result = scheduleDao.updateSchedule(sqlSession, sc);
		
		if(result < 0 ) {
			throw new CommException("일정 수정에 실패하였습니다.");
		}
		
		return result;
	}
	
	@Override
	public int deleteSchedule(Schedule sc) {
		int result = scheduleDao.deleteSchedule(sqlSession, sc);
		
		if(result < 0 ) {
			throw new CommException("일정 삭제에 실패하였습니다.");
		}
		
		return result;
	}

	@Override
	public ArrayList<Schedule> scheduleList(String empId) {
	
		return scheduleDao.scheduleList(sqlSession, empId);
	}

	@Override
	public int resizeUpdateSchedule(Schedule sc) {
		int result = scheduleDao.resizeUpdateSchedule(sqlSession, sc);
		
		if(result < 0 ) {
			throw new CommException("일정 리사이즈에 실패하였습니다.");
		}
		
		return result;
	}

	@Override
	public int dropUpdateSchedule(Schedule sc) {
		int result = scheduleDao.dropUpdateSchedule(sqlSession, sc);
		
		if(result < 0 ) {
			throw new CommException("일정 드롭에 실패하였습니다.");
		}
		
		return result;
	}



	
}
