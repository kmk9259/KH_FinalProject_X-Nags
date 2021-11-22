package com.kh.spring.employee.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.common.exception.CommException;

import com.kh.spring.employee.model.dao.EmployeeDao;
import com.kh.spring.employee.model.vo.Department;
import com.kh.spring.employee.model.vo.Employee;
import com.kh.spring.employee.model.vo.Job;
import com.kh.spring.employee.model.vo.PageInfo;
import com.kh.spring.employee.model.vo.Right;
import com.kh.spring.employee.model.vo.SalGrade;
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





	@Override
	public Employee loginEmployee(String empId) {
		return employeeDao.loginEmployee(sqlSession,empId);
	}

	@Override
	public Job selectJob(Employee loginEmp) {
		return employeeDao.selectJob(sqlSession,loginEmp);
	}

	@Override
	public Department selectdept(Employee loginEmp) {
		return employeeDao.selectdept(sqlSession,loginEmp);
	}

	@Override
	public ArrayList<Employee> selectList(PageInfo pi) {
		// TODO Auto-generated method stub
		return employeeDao.selectList(sqlSession, pi);
	}

	@Override
	public ArrayList<Employee> selectAttDay(String selectItem) {
		return employeeDao.selectAttDay(sqlSession, selectItem);
	}

	@Override
	public ArrayList<Job> selectJlist() {
		return employeeDao.selectJlist(sqlSession);
	}

	@Override
	public ArrayList<Department> selectDlist() {
		
		return employeeDao.selectDlist(sqlSession);
	}

	@Override
	public ArrayList<Right> selectRlist() {
		
		return employeeDao.selectRlist(sqlSession);
	}

	@Override
	public ArrayList<SalGrade> selectSlist() {
		// TODO Auto-generated method stub
		return employeeDao.selectSlist(sqlSession);
	}

	@Override
	public Employee selectEmp(int empId) {
	
		return employeeDao.selectEmp(sqlSession, empId);
	}

	@Override
	public String selectNextEmp() {
		return employeeDao.selectNextEmp(sqlSession);
	}

  @Override
	public Employee updateEmp(Employee emp) {
		int result = employeeDao.updateEmp(sqlSession, emp);
		
		if (result < 0) {
			throw new CommException("사원 업데이트 실패");
		}
		return emp;
		
	}

	@Override
	public void deleteEmp(int empId) {
		int result = employeeDao.deleteEmp(sqlSession, empId);
		if(result < 0) {
			throw new CommException("사원 삭제 실패");
		}
		
	}

	@Override
	public ArrayList<Employee> selectAllEmp() {
		return employeeDao.selectAllEmp(sqlSession);
	}

	




	



	

}
