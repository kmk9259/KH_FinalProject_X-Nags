package com.kh.spring.schedule.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.kh.spring.common.exception.CommException;
import com.kh.spring.schedule.model.dao.ScheduleDao;
import com.kh.spring.schedule.model.vo.Schedule;

public class ScheduleServiceImpl implements ScheduleService {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ScheduleDao scheduleDao;

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
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteSchedule(Schedule sc) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	
	

}
