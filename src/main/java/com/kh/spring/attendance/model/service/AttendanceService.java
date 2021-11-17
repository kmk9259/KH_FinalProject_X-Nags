package com.kh.spring.attendance.model.service;

import java.util.ArrayList;

import com.kh.spring.attendance.model.vo.AttStatus;
import com.kh.spring.attendance.model.vo.Attendance;
import com.kh.spring.employee.model.vo.Employee;
import com.kh.spring.member.model.vo.Member;

public interface AttendanceService {

	ArrayList<AttStatus> selectAttStatus();

	void insertIntime(Employee loginEmp);
	
	void insertOuttime(Employee loginEmp);

	Attendance selectTime(Employee loginEmp);
	
	//Attendance selectOuttime(Employee emp);

	ArrayList<Attendance> selectAttMy(Member mem);

	ArrayList<Employee> selectAttDay(Attendance att);

	ArrayList<Employee> selectAttMonth(Attendance att);

	void updateDay(Employee emp);

	void deleteDay(int attNo);

	

	




	

}
