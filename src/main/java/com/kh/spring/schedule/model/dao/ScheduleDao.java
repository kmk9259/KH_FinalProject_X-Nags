package com.kh.spring.schedule.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.schedule.model.vo.Schedule;

@Repository
public class ScheduleDao {

	public int insertSchedule(SqlSessionTemplate sqlSession, Schedule sc) {
		
		return sqlSession.insert("scheduleMapper.insertSchedule", sc);
	}

}
