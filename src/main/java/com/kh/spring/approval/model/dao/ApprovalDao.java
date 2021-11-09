package com.kh.spring.approval.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.approval.model.vo.Approval;
import com.kh.spring.mail.model.vo.PageInfo;

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

	public int selectAskApprovalListCount(SqlSessionTemplate sqlSession, String empId) {
		// TODO Auto-generated method stub
		return 0;
	}

	/*
	 * //휴가 신청 public int insertHoliday(SqlSessionTemplate sqlSession, Approval app)
	 * {
	 * 
	 * return sqlSession.insert("approvalMapper.insertHoliday", app); }
	 */
}
