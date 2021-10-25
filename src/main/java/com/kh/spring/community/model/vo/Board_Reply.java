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

	private int reply_no;
	private int board_no;
	private String reply_content;
	private String emp_id;
	private Date reply_date;
	
}
