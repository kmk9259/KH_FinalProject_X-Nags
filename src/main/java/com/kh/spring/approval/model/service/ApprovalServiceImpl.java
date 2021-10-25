package com.kh.spring.approval.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.approval.model.dao.ApprovalDao;

@Service
public class ApprovalServiceImpl implements ApprovalService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ApprovalDao approvalDao;

}
