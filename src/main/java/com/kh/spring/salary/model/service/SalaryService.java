package com.kh.spring.salary.model.service;

import com.kh.spring.employee.model.vo.Employee;
import com.kh.spring.salary.model.vo.Salary;

public interface SalaryService {

	void insertSalary(Salary sal);

	Salary selectSal(int empId);

	Salary updateSal(Salary sal);

	

}
