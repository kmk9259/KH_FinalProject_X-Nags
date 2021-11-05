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
import com.kh.spring.member.model.vo.Member;

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


	@Override
	public int selectReceiveMailListCount(String empId) {
		
		return mailDao.selectReceiveMailListCount(sqlSession, empId);
	}


	@Override
	public ArrayList<Mail> selectReceiveMailList(PageInfo pi, String empId) {
		
		return mailDao.selectReceiveMailList(sqlSession, pi, empId);
	}


	@Override
	public Mail selectReceiveMail(int mno) {
		
		Mail m = null;
		
		int result = mailDao.increaseCount(sqlSession, mno);
		
		if(result < 0) {
			throw new CommException("increaseCount 실패");
		}else {
			m = mailDao.selectReceiveMail(sqlSession, mno);
		}
		
		return m;
	}


	@Override
	public void wasteReceiveMail(int mno) {
		
		int result = mailDao.wasteReceiveMail(sqlSession, mno);
		
		if(result < 0) {
			throw new CommException("wasteReceiveMail 실패");
		}
		
	}


	@Override
	public void resendMail(Mail m) {

		int result = mailDao.resendMail(sqlSession, m);
		
		if(result < 0) {
			throw new CommException("메일 재전송 실패");
		}
		
	}


	@Override
	public Member getReceiver(String receiver) {
		return mailDao.getReceiver(sqlSession, receiver);
	}


//	@Override
//	public Member getReceiver(String receiver) {
//		
//		return mailDao.getReceiver(sqlSession, receiver);
//	}
	

	
}
