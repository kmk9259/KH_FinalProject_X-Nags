package com.kh.spring.attendance.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.attendance.model.vo.AttStatus;

@Repository
public class AttendanceDao {

	public ArrayList<AttStatus> selectAttStatus(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("attendanceMapper.selectAttStatus");
	}

}
