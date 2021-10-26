package com.kh.spring.employee.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.employee.model.vo.Employee;

@Repository
public class EmployeeDao {

	public int insertEmployee(SqlSessionTemplate sqlSession, Employee emp) {
		// TODO Auto-generated method stub
		return sqlSession.insert("employeeMapper.insertEmployee",emp);
	}

}
