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
public class Board {

	private int boardNo;
	private String empId;
	private String boardTitle;
	private String boardContent;
	private Date boardDate;
	private String originFile;	
	private int fileNo;
	private String changeFile;
	private String filePath;
	private Date uploadDate;
}
