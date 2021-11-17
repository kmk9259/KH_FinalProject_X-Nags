package com.kh.spring.community.model.vo;

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
public class Notice_Reply {

	private int replyNo;
	private int noticeNo;
	private String replyContent;
	private String empId;
	private Date replyDate;
	private String userName;
	
}
