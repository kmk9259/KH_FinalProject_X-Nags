package com.kh.spring.attendance.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.attendance.model.dao.AttendanceDao;
import com.kh.spring.attendance.model.vo.AttStatus;

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

}
