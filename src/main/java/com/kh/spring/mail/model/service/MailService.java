package com.kh.spring.mail.model.service;

import com.kh.spring.mail.model.vo.Mail;

public interface MailService {

	void insertMail(Mail m);

	int selectSendMailListCount();

}
