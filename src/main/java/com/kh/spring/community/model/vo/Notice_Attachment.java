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
public class Notice_Attachment {

	private int fileNo;
	private int noticeNo;
	private String originFile;
	private String changeFile;
	private String filePath;
	private Date uploadDate;
	
	
}
