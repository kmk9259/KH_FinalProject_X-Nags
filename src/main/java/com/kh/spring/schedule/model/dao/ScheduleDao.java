package com.kh.spring.schedule.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.employee.model.vo.Employee;
import com.kh.spring.member.model.vo.Member;
import com.kh.spring.schedule.model.vo.Schedule;

@Repository
public class ScheduleDao {

	public int insertSchedule(SqlSessionTemplate sqlSession, Schedule sc) {
		
		return sqlSession.insert("scheduleMapper.insertSchedule", sc);
	}

	public Employee selectEmployee(SqlSessionTemplate sqlSession, Member mem) {
		
		return sqlSession.selectOne("scheduleMapper.selectEmployee", mem);
	}

}
