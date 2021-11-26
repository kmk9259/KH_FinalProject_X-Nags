package com.kh.spring.mail.model.service;

import java.util.ArrayList;

import com.kh.spring.employee.model.vo.Employee;
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

	int selectWasteMailListCount(String empId);

	ArrayList<Mail> selectWasteMailList(PageInfo pi, String empId);

	void insertReply(Mail m);

	void returnSendMail(int mno);

	void returnReceiveMail(int mno);

	void wasteMail(int mno);

	void updateWriter(int mno);

	void updateReceiver(int mno);

	ArrayList<Employee> selectEmployeeList(String deptCode);

	Member selectSendEmp(int mno);

	Mail selectMail(int mno);

	Member selectReceiveEmp(int mno);

	ArrayList<Mail> mainSendMailList(String empId);

	ArrayList<Mail> mainReceiveMailList(String empId);

	int selectCountNoRead(String empId);





}
