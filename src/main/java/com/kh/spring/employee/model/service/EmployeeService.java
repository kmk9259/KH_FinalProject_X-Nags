package com.kh.spring.employee.model.service;

import java.util.ArrayList;

import com.kh.spring.employee.model.vo.Department;
import com.kh.spring.employee.model.vo.Employee;
import com.kh.spring.employee.model.vo.Job;
import com.kh.spring.employee.model.vo.PageInfo;
import com.kh.spring.employee.model.vo.Right;
import com.kh.spring.employee.model.vo.SalGrade;
import com.kh.spring.member.model.vo.Member;


public interface EmployeeService {

	void insertEmployee(Employee emp);

	int selectListCount();

	ArrayList<Employee> selectList(PageInfo pi);

	Employee loginEmployee(String empId);

	Job selectJob(Employee loginEmp);

	Department selectdept(Employee loginEmp);

	ArrayList<Employee> selectAttDay(String selectItem);

	ArrayList<Job> selectJlist();

	ArrayList<Department> selectDlist();

	ArrayList<Right> selectRlist();

	ArrayList<SalGrade> selectSlist();

	Employee selectEmp(int empId);

	String selectNextEmp();

	Employee updateEmp(Employee emp);

	void deleteEmp(int empId);

	ArrayList<Employee> selectAllEmp();

	



	

	


}
