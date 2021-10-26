package com.kh.spring.employee.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.common.exception.CommException;
import com.kh.spring.employee.model.dao.EmployeeDao;
import com.kh.spring.employee.model.vo.Employee;


@Service
public class EmployeeServiceImpl implements EmployeeService {

	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private EmployeeDao employeeDao;
	
	@Override
	public void insertEmployee(Employee emp) {
		int result = employeeDao.insertEmployee(sqlSession, emp);
		if(result < 0) {
			throw new CommException("사원등록 실패");
		}
		
	}

}
