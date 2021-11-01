package com.kh.spring.attendance.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.attendance.model.vo.AttStatus;
import com.kh.spring.attendance.model.vo.Attendance;
import com.kh.spring.employee.model.vo.Employee;
import com.kh.spring.member.model.vo.Member;

@Repository
public class AttendanceDao {

	public ArrayList<AttStatus> selectAttStatus(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("attendanceMapper.selectAttStatus");
	}

	public int insertIntime(SqlSessionTemplate sqlSession, Employee loginEmp) {
		return sqlSession.insert("attendanceMapper.insertIntime",loginEmp);
	}

	public Attendance selectIntime(SqlSessionTemplate sqlSession, Employee loginEmp) {
		return sqlSession.selectOne("attendanceMapper.selectIntime",loginEmp);
	}

	public ArrayList<Attendance> selectAttMy(SqlSessionTemplate sqlSession, Member mem) {
		return (ArrayList)sqlSession.selectList("attendanceMapper.selectAttMy",mem);
	}

	

}
