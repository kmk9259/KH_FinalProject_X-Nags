package com.kh.spring.approval.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.approval.model.dao.ApprovalDao;
import com.kh.spring.approval.model.vo.Approval;
import com.kh.spring.common.exception.CommException;

@Service
public class ApprovalServiceImpl implements ApprovalService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ApprovalDao approvalDao;

	@Override
	public void insertApproval(Approval app) {

		int result = approvalDao.insertApproval(sqlSession, app);
		
		if(result < 0) {
			throw new CommException("결재 전송 실패");
		}
		
	}

}
