package com.kh.spring.attendance.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.attendance.model.dao.AttendanceDao;
import com.kh.spring.attendance.model.vo.AttStatus;
import com.kh.spring.attendance.model.vo.Attendance;
import com.kh.spring.common.exception.CommException;
import com.kh.spring.employee.model.vo.Employee;
import com.kh.spring.member.model.vo.Member;

@Service
public class AttendanceServiceImpl implements AttendanceService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private AttendanceDao attendanceDao;
	
	@Override
	public ArrayList<AttStatus> selectAttStatus() {
		return attendanceDao.selectAttStatus(sqlSession);
	}

	@Override
	public void insertIntime(Employee emp) {
		int result= attendanceDao.insertIntime(sqlSession, emp);
		
		if(result <0) {
			throw new CommException("출석 실패");
		}
	}
	@Override
	public void insertOuttime(Employee loginEmp) {
		int result= attendanceDao.insertOuttime(sqlSession, loginEmp);
		
		if(result <0) {
			throw new CommException("퇴근 실패");
		}
		
	}

	@Override
	public Attendance selectTime(Employee emp) {
		return attendanceDao.selectTime(sqlSession, emp);
	}
	
	@Override
	public ArrayList<Attendance> selectAttMy(Member mem) {
		return attendanceDao.selectAttMy(sqlSession, mem);
	}

	@Override
	public ArrayList<Employee> selectAttDay(Attendance att) {
		return attendanceDao.selectAttDay(sqlSession, att);
	}

	@Override
	public ArrayList<Employee> selectAttMonth(Attendance att) {
		return attendanceDao.selectAttMonth(sqlSession, att);
	}

	@Override
	public void updateDay(Employee emp) {
		int result = attendanceDao.updateDay(sqlSession, emp);
		if(result < 0) {
			throw new CommException("근태 수정 실패");
		}		
	}

	@Override
	public void deleteDay(int attNo) {
		int result = attendanceDao.deleteDay(sqlSession, attNo);
		if(result < 0) {
			throw new CommException("근태 삭제 실패");
		}		
	}

	@Override
	public void updateMonth(Employee emp) {
		int result = attendanceDao.updateMonth(sqlSession, emp);
		if(result < 0) {
			throw new CommException("근태 수정 실패");
		}
	}

	@Override
	public void deleteMonth(int attNo) {
		int result = attendanceDao.deleteMonth(sqlSession, attNo);
		if(result < 0) {
			throw new CommException("근태 삭제 실패");
		}		
	}

	

	


	

	


}
