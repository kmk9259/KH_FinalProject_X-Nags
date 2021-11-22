package com.kh.spring.employee.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.employee.model.vo.Department;
import com.kh.spring.employee.model.vo.Employee;
import com.kh.spring.employee.model.vo.Job;
import com.kh.spring.employee.model.vo.PageInfo;
import com.kh.spring.employee.model.vo.Right;
import com.kh.spring.employee.model.vo.SalGrade;
import com.kh.spring.member.model.vo.Member;

@Repository
public class EmployeeDao {

	public int insertEmployee(SqlSessionTemplate sqlSession, Employee emp) {
		// TODO Auto-generated method stub
		return sqlSession.insert("employeeMapper.insertEmployee",emp);
	}

	public int selectListCount(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("employeeMapper.selectListCount");
	}

	public ArrayList<Employee> selectList(SqlSessionTemplate sqlSession, PageInfo pi) {
		// TODO Auto-generated method stub
		int offset = (pi.getCurrentPage() -1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("employeeMapper.selectList", null, rowBounds);
	}

	public Employee loginEmployee(SqlSessionTemplate sqlSession, String empId) {
		return sqlSession.selectOne("employeeMapper.loginEmployee",empId);
	}

	public Job selectJob(SqlSessionTemplate sqlSession, Employee loginEmp) {
		return sqlSession.selectOne("employeeMapper.selectJob",loginEmp);
	}

	public Department selectdept(SqlSessionTemplate sqlSession, Employee loginEmp) {
		return sqlSession.selectOne("employeeMapper.selectdept",loginEmp);
	}

	public ArrayList<Employee> selectAttDay(SqlSessionTemplate sqlSession, String selectItem) {
		if(selectItem.equals("dept_code")) {
			return (ArrayList)sqlSession.selectList("employeeMapper.attOrderByDept");
		}else {
			return (ArrayList)sqlSession.selectList("employeeMapper.attOrderByJob");
		}
		
	}

	public ArrayList<Job> selectJlist(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("employeeMapper.selectJlist");
	}

	public ArrayList<Department> selectDlist(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("employeeMapper.selectDlist");
	}

	public ArrayList<Right> selectRlist(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("employeeMapper.selectRlist");
	}

	public ArrayList<SalGrade> selectSlist(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("employeeMapper.selectSlist");
	}

	public Employee selectEmp(SqlSessionTemplate sqlSession, int empId) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("employeeMapper.selectEmp", empId);
	}


	public String selectNextEmp(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("employeeMapper.selectNextEmp");
	}


	public int updateEmp(SqlSessionTemplate sqlSession, Employee emp) {
		// TODO Auto-generated method stub
		return sqlSession.update("employeeMapper.updateEmp", emp);
	}

	public int deleteEmp(SqlSessionTemplate sqlSession, int empId) {
		// TODO Auto-generated method stub
		return sqlSession.delete("employeeMapper.deleteEmp", empId);
	}

	public ArrayList<Employee> selectAllEmp(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("employeeMapper.selectAllEmp");	}

	




}
