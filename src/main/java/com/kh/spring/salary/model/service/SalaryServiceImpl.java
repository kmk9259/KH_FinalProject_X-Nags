package com.kh.spring.salary.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.common.exception.CommException;
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

}
