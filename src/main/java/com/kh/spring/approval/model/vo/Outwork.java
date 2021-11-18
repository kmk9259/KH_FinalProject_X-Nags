package com.kh.spring.approval.model.vo;

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
public class Outwork {
	
	private int outNo;
	private int appNo;
	private String empId;
	private Date outDate;
	

}
