package com.kh.spring.community.model.vo;

import java.util.Date;

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
public class Board_Reply {

	private int replyNo;
	private int boardNo;
	private String replyContent;
	private String empId;
	private Date replyDate;
	
	
}
