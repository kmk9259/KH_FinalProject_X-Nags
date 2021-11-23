package com.kh.spring.attendance.model.service;

import java.util.ArrayList;

import com.kh.spring.approval.model.vo.Outwork;
import com.kh.spring.attendance.model.vo.AttStatus;
import com.kh.spring.attendance.model.vo.Attendance;
import com.kh.spring.employee.model.vo.Employee;
import com.kh.spring.holiday.model.vo.Holiday;
import com.kh.spring.member.model.vo.Member;

public interface AttendanceService {

	ArrayList<AttStatus> selectAttStatus();

	void updateIntime(Employee loginEmp);
	
	void updateOuttime(Employee loginEmp);

	Attendance selectTime(Employee loginEmp);
	
	//Attendance selectOuttime(Employee emp);

	ArrayList<Attendance> selectAttMy(Member mem);

	ArrayList<Employee> selectAttDay(Attendance att);

	ArrayList<Employee> selectAttMonth(Attendance att);

	void updateDay(Employee emp);

	void deleteDay(int attNo);

	void updateMonth(Employee emp);

	void deleteMonth(int attNo);

	void updateStatus(Attendance att);

	ArrayList<Holiday> selectHoliday(String empId);

	void insertAnnual(Attendance a);

	void insertAllEmp(String empId);

	ArrayList<Attendance> selectAbsence();

	Outwork selectOutwork(String empId);

	void updateOutwork(Attendance a);

	void updateHalfway(Attendance att);

	void updateAnnual(Attendance att);

	ArrayList<Attendance> attCountList(String empId);




	

	




	

}
