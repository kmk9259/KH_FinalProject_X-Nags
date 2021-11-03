package com.kh.spring.mail.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.mail.model.vo.Mail;
import com.kh.spring.mail.model.vo.PageInfo;

@Repository
public class MailDao {

	//메일 작성
	public int insertMail(SqlSessionTemplate sqlSession, Mail m) {
		// TODO Auto-generated method stub
		return sqlSession.insert("mailMapper.insertMail", m);
	}
	
	//보낸 메일함 리스트 수
	public int selectSendMailListCount(SqlSessionTemplate sqlSession, String empId) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("mailMapper.selectSendMailListCount", empId);
	}
	
	//보낸 메일함 리스트
	public ArrayList<Mail> selectSendMailList(SqlSessionTemplate sqlSession, PageInfo pi, String empId) {
		
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit()); 
		
		return (ArrayList)sqlSession.selectList("mailMapper.selectSendMailList", empId, rowBounds);
	}

}
