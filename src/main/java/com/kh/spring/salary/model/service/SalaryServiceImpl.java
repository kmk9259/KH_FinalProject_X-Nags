package com.kh.spring.salary.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.common.exception.CommException;
import com.kh.spring.employee.model.vo.Employee;
import com.kh.spring.salary.model.dao.SalaryDao;
import com.kh.spring.salary.model.vo.Salary;

@Service
public class SalaryServiceImpl implements SalaryService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private SalaryDao salaryDao;
	
	@Override
	public void insertSalary(Salary sal) {
		int result = salaryDao.insertSalary(sqlSession, sal);
		if(result < 0) {
			throw new CommException("사원등록 실패");
		}
		
	}

	@Override
	public Salary selectSal(int empId) {
		
		return salaryDao.selectSal(sqlSession, empId);
	}

	@Override
	public Salary updateSal(Salary sal) {
		int result =  salaryDao.updateSal(sqlSession, sal);
		if (result < 0) {
			throw new CommException("사원 업데이트 실패");
		}
		return sal;
	}

	

}
