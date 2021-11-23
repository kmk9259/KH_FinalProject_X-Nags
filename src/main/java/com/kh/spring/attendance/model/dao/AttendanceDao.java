package com.kh.spring.attendance.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.approval.model.vo.Outwork;
import com.kh.spring.attendance.model.vo.AttStatus;
import com.kh.spring.attendance.model.vo.Attendance;
import com.kh.spring.employee.model.vo.Employee;
import com.kh.spring.holiday.model.vo.Holiday;
import com.kh.spring.member.model.vo.Member;

@Repository
public class AttendanceDao {

	public ArrayList<AttStatus> selectAttStatus(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("attendanceMapper.selectAttStatus");
	}

	public int updateIntime(SqlSessionTemplate sqlSession, Employee loginEmp) {
		return sqlSession.insert("attendanceMapper.updateIntime",loginEmp);
	}

	public int updateOuttime(SqlSessionTemplate sqlSession, Employee loginEmp) {
		return sqlSession.insert("attendanceMapper.updateOuttime",loginEmp);
	}

	public Attendance selectTime(SqlSessionTemplate sqlSession, Employee loginEmp) {
		return sqlSession.selectOne("attendanceMapper.selectTime",loginEmp);
	}	

	public ArrayList<Attendance> selectAttMy(SqlSessionTemplate sqlSession, Member mem) {
		return (ArrayList)sqlSession.selectList("attendanceMapper.selectAttMy",mem);
	}

	public ArrayList<Employee> selectAttDay(SqlSessionTemplate sqlSession, Attendance att) {
		return (ArrayList)sqlSession.selectList("attendanceMapper.selectAttDay",att);
	}

	public ArrayList<Employee> selectAttMonth(SqlSessionTemplate sqlSession, Attendance att) {
		return (ArrayList)sqlSession.selectList("attendanceMapper.selectAttMonth",att);
	}

	public int updateDay(SqlSessionTemplate sqlSession, Employee emp) {
		return sqlSession.update("attendanceMapper.updateDay",emp);
	}

	public int deleteDay(SqlSessionTemplate sqlSession, int attNo) {
		return sqlSession.delete("attendanceMapper.deleteDay",attNo);
	}

	public int updateMonth(SqlSessionTemplate sqlSession, Employee emp) {
		return sqlSession.update("attendanceMapper.updateMonth",emp);
	}

	public int deleteMonth(SqlSessionTemplate sqlSession, int attNo) {
		return sqlSession.delete("attendanceMapper.deleteMonth",attNo);
	}

	public int updateStatus(SqlSessionTemplate sqlSession, Attendance att) {
		return sqlSession.update("attendanceMapper.updateStatus",att);
	}

	public ArrayList<Holiday> selectHoliday(SqlSessionTemplate sqlSession, String empId) {
		return (ArrayList)sqlSession.selectList("attendanceMapper.selectHoliday",empId);
	}

	public int insertAnnual(SqlSessionTemplate sqlSession, Attendance a) {
		return sqlSession.insert("attendanceMapper.insertAnnual",a);
	}

	public int insertAllEmp(SqlSessionTemplate sqlSession, String empId) {
		return sqlSession.insert("attendanceMapper.insertAllEmp",empId);
	}

	public ArrayList<Attendance> selectAbsence(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("attendanceMapper.selectAbsence");
	}

	public Outwork selectOutwork(SqlSessionTemplate sqlSession, String empId) {
		return sqlSession.selectOne("attendanceMapper.selectOutwork", empId);
	}

	public int updateOutwork(SqlSessionTemplate sqlSession, Attendance a) {
		return sqlSession.insert("attendanceMapper.updateOutwork",a);
	}

	public int updateHalfway(SqlSessionTemplate sqlSession, Attendance att) {
		return sqlSession.insert("attendanceMapper.updateHalfway",att);
	}

	public int updateAnnual(SqlSessionTemplate sqlSession, Attendance att) {
		return sqlSession.insert("attendanceMapper.updateAnnual",att);
	}

	public ArrayList<Attendance> attCountList(SqlSessionTemplate sqlSession, String empId) {
		return (ArrayList)sqlSession.selectList("attendanceMapper.attCountList", empId);
	}





	

	

	


	

}
