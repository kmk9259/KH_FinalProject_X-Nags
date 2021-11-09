package com.kh.spring.approval.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.approval.model.dao.ApprovalDao;
import com.kh.spring.approval.model.vo.Approval;
import com.kh.spring.common.exception.CommException;
import com.kh.spring.mail.model.vo.PageInfo;

@Service
public class ApprovalServiceImpl implements ApprovalService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ApprovalDao approvalDao;
	
	//결재신청
	@Override
	public void insertApproval(Approval app) {

		int result = approvalDao.insertApproval(sqlSession, app);
		
		if(result < 0) {
			throw new CommException("결재 전송 실패");
		}
		
	}

	//진행중 결제함 카운트
	@Override
	public int selectApprovalListCount(String empId) {
		return approvalDao.selectApprovalListCount(sqlSession, empId);
	}

	//진행중 결재함 리스트
	@Override
	public ArrayList<Approval> selectApprovalList(PageInfo pi, String empId) {
		
		return approvalDao.selectApprovalList(sqlSession, pi, empId);
	}
	
	//결재 요청함 리스트 수
	@Override
	public int selectAskApprovalListCount(String empId) {
		
		return approvalDao.selectAskApprovalListCount(sqlSession, empId);
	}
	
	//결재 요청함 리스트
	@Override
	public ArrayList<Approval> selectAskApprovalList(PageInfo pi, String empId) {
		
		return null;
	}
	
	/*
	 * //휴가 신청
	 * 
	 * @Override public void insertHoliday(Approval app) {
	 * 
	 * int result = approvalDao.insertHoliday(sqlSession, app);
	 * 
	 * if(result < 0) { throw new CommException("휴가 신청 실패"); }
	 * 
	 * }
	 */

}
