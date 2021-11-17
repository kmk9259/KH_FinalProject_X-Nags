package com.kh.spring.schedule.model.dao;

import java.util.ArrayList;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.schedule.model.vo.ConvertScheduleVo;
import com.kh.spring.schedule.model.vo.Schedule;

@Repository
public class ScheduleDao {

	public int insertSchedule(SqlSessionTemplate sqlSession, Schedule sc) {
		
		return sqlSession.insert("scheduleMapper.insertSchedule", sc);
	}

	public ArrayList<Schedule> scheduleMain(SqlSessionTemplate sqlSession, Map<String, String> paramMap) {
		
		return (ArrayList)sqlSession.selectList("scheduleMapper.scheduleMain", paramMap);
	}

//	public Employee selectEmployee(SqlSessionTemplate sqlSession, Member mem) {
//		
//		return sqlSession.selectOne("scheduleMapper.selectEmployee", mem);
//	}



}
