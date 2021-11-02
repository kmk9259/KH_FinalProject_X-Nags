package com.kh.spring.mail.model.service;

import java.util.ArrayList;

import com.kh.spring.mail.model.vo.Mail;
import com.kh.spring.mail.model.vo.PageInfo;

public interface MailService {

	void insertMail(Mail m);

	int selectSendMailListCount(String empId);

	ArrayList<Mail> selectSendMailList(PageInfo pi, String empId);

}
