package com.kh.spring.mail.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.common.exception.CommException;
import com.kh.spring.employee.model.vo.Employee;
import com.kh.spring.mail.model.dao.MailDao;
import com.kh.spring.mail.model.vo.Mail;
import com.kh.spring.mail.model.vo.PageInfo;

@Service
public class MailServiceImpl implements MailService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private MailDao mailDao;

	@Override
	public void insertMail(Mail m) {
		
		int result = mailDao.insertMail(sqlSession, m);
		
		if(result < 0) {
			throw new CommException("메일 전송 실패");
		}
		
	}

	
	@Override
	public int selectSendMailListCount(String empId) {
		// TODO Auto-generated method stub
		return mailDao.selectSendMailListCount(sqlSession, empId);
	}



	@Override
	public ArrayList<Mail> selectSendMailList(PageInfo pi, String empId) {
	
		return mailDao.selectSendMailList(sqlSession, pi, empId);
	}


	@Override
	public Mail selectSendMail(int mno) {
		
		return mailDao.selectSendMail(sqlSession, mno);
	}
	

	
}
