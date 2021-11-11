package com.kh.spring.community.model.vo;

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
public class VotingA{

	private int votingNo;
	private int refNo;
	private String Content;
	private int count;
	

}
