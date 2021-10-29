package com.kh.spring.employee.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.common.exception.CommException;
import com.kh.spring.community.model.vo.PageInfo;
import com.kh.spring.employee.model.dao.EmployeeDao;
import com.kh.spring.employee.model.vo.Department;
import com.kh.spring.employee.model.vo.Employee;
import com.kh.spring.employee.model.vo.Job;
import com.kh.spring.member.model.vo.Member;


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

//	@Override
//	public ArrayList<Employee> selectList(PageInfo pi) {
//		// TODO Auto-generated method stub
//		return employeeDao.selectList(sqlSession, pi);
//	}

	@Override
	public ArrayList<Employee> selectList(com.kh.spring.employee.model.vo.PageInfo pi) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Employee loginEmployee(Member m) {
		return employeeDao.loginEmployee(sqlSession,m);
	}

	@Override
	public Job selectJob(Employee loginEmp) {
		return employeeDao.selectJob(sqlSession,loginEmp);
	}

	@Override
	public Department selectdept(Employee loginEmp) {
		return employeeDao.selectdept(sqlSession,loginEmp);
	}

	



	

}
