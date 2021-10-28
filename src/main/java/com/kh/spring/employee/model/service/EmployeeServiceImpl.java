package com.kh.spring.employee.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.common.exception.CommException;
import com.kh.spring.employee.model.dao.EmployeeDao;
import com.kh.spring.employee.model.vo.Employee;
import com.kh.spring.employee.model.vo.PageInfo;


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

	@Override
	public int selectListCount() {
		// TODO Auto-generated method stub
		return employeeDao.selectListCount(sqlSession);
	}

	@Override
	public ArrayList<Employee> selectList(PageInfo pi) {
		// TODO Auto-generated method stub
		return employeeDao.selectList(sqlSession, pi);
	}

	



	

}
