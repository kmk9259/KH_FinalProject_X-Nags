package com.kh.spring.mail.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Mail {
	
	private int mailNo;
	private String empId;
	private String receiver;
	private String title;
	private String content;
	private Date date;
	private int readCount;
	private int importantFlag;
	private int writerStatus;
	private int receiverStatus;
	
	private String originName;
	private String changeName;
	
	

}
