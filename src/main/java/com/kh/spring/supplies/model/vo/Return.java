package com.kh.spring.supplies.model.vo;

import java.sql.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString
public class Return {
	
	private int reNo;

	private int suppliesNo;
	private String suppliesCode;
	private String empId;
	private String suppliesName;
	private String counts;
	
	//@DateTimeFormat(pattern ="yyyy-MM-dd")
	private Date startDate;
	
	//@DateTimeFormat(pattern ="yyyy-MM-dd")
	private Date endDate;
	private String status;
	
	private String userName;
	

	
	
}
