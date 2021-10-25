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
public class Board_Attachment {

	private int fileNo;
	private int boardNo;
	private String originFile;
	private String changeFile;
	private String filePath;
	private Date uploadDate;
	
	

}
