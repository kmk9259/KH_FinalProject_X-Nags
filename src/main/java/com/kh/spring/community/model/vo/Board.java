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
	private String originFile;	
	private String changeFile;
	private String filePath;
	private int count;
	private Date uploadDate;
}
