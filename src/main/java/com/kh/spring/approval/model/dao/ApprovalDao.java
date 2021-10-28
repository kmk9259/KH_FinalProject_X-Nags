package com.kh.spring.approval.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.approval.model.vo.Approval;

@Repository
public class ApprovalDao {
	
	//결재 작성
	public int insertApproval(SqlSessionTemplate sqlSession, Approval app) {
		// TODO Auto-generated method stub
		return 0;
	}

}
