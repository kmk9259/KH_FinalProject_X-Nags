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


	@Override
	public void insertSendDelivery(Mail m) {

		int result = mailDao.insertSendDelivery(sqlSession, m);
		
		if(result < 0) {
			throw new CommException("메일 전달 실패");
		}
		
	}


	@Override
	public void wasteSendMail(int mno) {

		int result = mailDao.wasteSendMail(sqlSession, mno);
		
		if(result < 0) {
			throw new CommException("메일 휴지통 이동 실패");
		}
		
	}


	@Override
	public int selectWasteMailListCount(String empId) {
		
		return mailDao.selectWasteMailListCount(sqlSession, empId);
	}


	@Override
	public ArrayList<Mail> selectWasteMailList(PageInfo pi, String empId) {
	
		return mailDao.selectWasteMailList(sqlSession, pi, empId);
	}


	@Override
	public void insertReply(Mail m) {
		
		int result = mailDao.insertReply(sqlSession, m);
		
		if(result < 0) {
			throw new CommException("메일 답장 실패");
		}
		
	}


	@Override
	public void returnSendMail(int mno) {
		
		int result = mailDao.returnSendMail(sqlSession, mno);
		
		if(result < 0) {
			throw new CommException("returnSendMail 실패");
		}
		
	}


	@Override
	public void returnReceiveMail(int mno) {

		int result = mailDao.returnReceiveMail(sqlSession, mno);
		
		if(result < 0) {
			throw new CommException("returnReceiveMail 실패");
		}
		
	}

	//메일 영구삭제
	@Override
	public void wasteMail(int mno) {
		int result = mailDao.wasteMail(sqlSession, mno);
		
		if(result < 0) {
			throw new CommException("wasteMail 실패");
		}
		
	}

	
	@Override
	public void updateWriter(int mno) {
		
		int result = mailDao.updateWriter(sqlSession, mno);
		
		if(result < 0) {
			throw new CommException("updateWriter 실패");
		}
		
	}


	@Override
	public void updateReceiver(int mno) {
		
		int result = mailDao.updateReceiver(sqlSession, mno);
		
		if(result < 0) {
			throw new CommException("updateReceiver 실패");
		}		
	}


	@Override
	public ArrayList<Employee> selectEmployeeList(String deptCode) {
		
		return mailDao.selectEmployeeList(sqlSession, deptCode);
	}


	@Override
	public Member selectSendEmp(int mno) {
		
		return mailDao.selectSendEmp(sqlSession, mno);
	}


	@Override
	public Mail selectMail(int mno) {
		
		return mailDao.selectMail(sqlSession, mno);
	}

 
	@Override
	public Member selectReceiveEmp(int mno) {
		
		return mailDao.selectReceiveEmp(sqlSession, mno);
	}


	@Override
	public ArrayList<Mail> mainSendMailList(String empId) {
		
		return mailDao.mainSendMailList(sqlSession, empId);
	}


	@Override
	public ArrayList<Mail> mainReceiveMailList(String empId) {
		return mailDao.mainReceiveMailList(sqlSession, empId);
	}


	@Override
	public int selectCountNoRead(String empId) {
		
		return mailDao.selectCountNoRead(sqlSession, empId);
	}

	


	
}
