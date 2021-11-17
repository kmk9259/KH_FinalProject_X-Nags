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
public class VotingG{

	private int gno;
	private int gRefNo;
	private String empId;
	private int votingGrant;
	private int result;

}
