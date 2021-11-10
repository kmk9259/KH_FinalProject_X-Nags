package com.kh.spring.approval.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.approval.model.vo.Approval;
import com.kh.spring.employee.model.vo.Employee;
import com.kh.spring.approval.model.vo.PageInfo;

@Repository
public class ApprovalDao {
	
	//결재 작성
	public int insertApproval(SqlSessionTemplate sqlSession, Approval app) {
		
		return sqlSession.insert("approvalMapper.insertApproval", app);
	}
	
	//진행중 결재함 카운트
	public int selectApprovalListCount(SqlSessionTemplate sqlSession, String empId) {
		
		return sqlSession.selectOne("approvalMapper.selectApprovalListCount", empId);
	}

	//진행중 결재함 리스트 보기
	public ArrayList<Approval> selectApprovalList(SqlSessionTemplate sqlSession, PageInfo pi, String empId) {
		
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit()); 
		
		
		return (ArrayList)sqlSession.selectList("approvalMapper.selectApprovalList", empId, rowBounds);
	}
	
	//결재 요청함 수
	public int selectAskApprovalListCount(SqlSessionTemplate sqlSession, String empId) {
		
		return sqlSession.selectOne("approvalMapper.selectAskApprovalListCount", empId);
	}
	
	//결재 요청함 리스트
	public ArrayList<Approval> selectAskApprovalList(SqlSessionTemplate sqlSession, PageInfo pi, String empId) {

		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit()); 
		
		return (ArrayList)sqlSession.selectList("approvalMapper.selectAskApprovalList", empId, rowBounds);
	}

	//결재 요청함 보기
	public Approval selectAskApprovalDetail(SqlSessionTemplate sqlSession, int ano) {
		
		return sqlSession.selectOne("approvalMapper.selectAskApprovalDetail", ano);
	}
	
	//기안자정보
	public Employee selectAppWriter(SqlSessionTemplate sqlSession, String empId) {
		
		return sqlSession.selectOne("approvalMapper.selectAppWriter", empId);
	}
	
	//중간결재자 정보
	public Employee selectAppMid(SqlSessionTemplate sqlSession, String appMid) {
		
		return sqlSession.selectOne("approvalMapper.selectAppMid", appMid);
	}
	
	//최종결재자 정보
	public Employee selectAppFin(SqlSessionTemplate sqlSession, String appFin) {
		
		return sqlSession.selectOne("approvalMapper.selectAppFin", appFin);
	}

	/*
	 * //휴가 신청 public int insertHoliday(SqlSessionTemplate sqlSession, Approval app)
	 * {
	 * 
	 * return sqlSession.insert("approvalMapper.insertHoliday", app); }
	 */
	
}
