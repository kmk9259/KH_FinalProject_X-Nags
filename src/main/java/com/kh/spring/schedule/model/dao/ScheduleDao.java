package com.kh.spring.schedule.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.spring.schedule.model.vo.Schedule;

public class ScheduleDao {

	public int insertSchedule(SqlSessionTemplate sqlSession, Schedule sc) {
		
		return sqlSession.insert("scheduleMapper.insertSchedule", sc);
	}

}
