package com.kh.spring.salary.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.salary.model.vo.Salary;

@Repository
public class SalaryDao {

	public int insertSalary(SqlSessionTemplate sqlSession, Salary sal) {
		
		return sqlSession.insert("salaryMapper.insertSal",sal);
	}

}
