package com.kh.spring.mail.model.service;

import java.util.ArrayList;

import com.kh.spring.mail.model.vo.Mail;
import com.kh.spring.mail.model.vo.PageInfo;
import com.kh.spring.member.model.vo.Member;

public interface MailService {

	void insertMail(Mail m);

	int selectSendMailListCount(String empId);

	ArrayList<Mail> selectSendMailList(PageInfo pi, String empId);

	Mail selectSendMail(int mno);

	int selectReceiveMailListCount(String empId);

	ArrayList<Mail> selectReceiveMailList(PageInfo pi, String empId);

	Mail selectReceiveMail(int mno);

	void wasteReceiveMail(int mno);

	void resendMail(Mail m);

	Member getReceiver(String receiver);

	void insertSendDelivery(Mail m);

	void wasteSendMail(int mno);


}
