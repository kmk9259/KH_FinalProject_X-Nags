package com.kh.spring.mail.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.mail.model.vo.Mail;

@Repository
public class MailDao {

	//메일 작성
	public int insertMail(SqlSessionTemplate sqlSession, Mail m) {
		// TODO Auto-generated method stub
		return sqlSession.insert("mailMapper.insertMail", m);
	}

	//보낸 메일함 리스트 수
	public int selectSendMailListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("mailMapper.selectSendMailListCount");
	}

}
