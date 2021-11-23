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
public class Notice {

	private int noticeNo;
	private String empId;
	private String noticeTitle;
	private String noticeContent;
	private String originFile;	
	private String changeFile;
	private String filePath;
	private int count;
	private Date uploadDate;
	private String rightNo;
	private String userName;
	private String deptName;
}
