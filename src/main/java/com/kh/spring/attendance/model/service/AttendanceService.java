package com.kh.spring.attendance.model.service;

import java.util.ArrayList;

import com.kh.spring.attendance.model.vo.AttStatus;
import com.kh.spring.attendance.model.vo.Attendance;
import com.kh.spring.employee.model.vo.Employee;
import com.kh.spring.member.model.vo.Member;

public interface AttendanceService {

	ArrayList<AttStatus> selectAttStatus();

	void insertIntime(Employee loginEmp);

	Attendance selectIntime(Employee loginEmp);

	ArrayList<Attendance> selectAttMy(Member mem);
	

	

}
