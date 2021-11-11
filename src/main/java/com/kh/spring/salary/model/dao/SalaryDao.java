package com.kh.spring.salary.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.salary.model.vo.Salary;

@Repository
public class SalaryDao {

	public int insertSalary(SqlSessionTemplate sqlSession, Salary sal) {
		
		return sqlSession.insert("salaryMapper.insertSal",sal);
	}

	public Salary selectSal(SqlSessionTemplate sqlSession, int empId) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("salaryMapper.selectSal", empId);
	}

	public int updateSal(SqlSessionTemplate sqlSession, Salary sal) {
		// TODO Auto-generated method stub
		return sqlSession.update("salaryMapper.updateSal", sal);
	}

}
