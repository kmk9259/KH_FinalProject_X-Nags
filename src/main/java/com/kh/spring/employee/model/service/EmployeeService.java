package com.kh.spring.employee.model.service;

import java.util.ArrayList;

import com.kh.spring.employee.model.vo.Employee;
import com.kh.spring.employee.model.vo.PageInfo;


public interface EmployeeService {

	void insertEmployee(Employee emp);

	int selectListCount();

	ArrayList<Employee> selectList(PageInfo pi);

	

	

	


}
