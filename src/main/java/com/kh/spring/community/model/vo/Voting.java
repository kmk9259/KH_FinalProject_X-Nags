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
public class Voting {

	private int votingNo;
	private String votingTitle;
	private String votingContent;
	private String empId;
	private int count;
	private Date votingDate;

	

}
