package com.kh.spring.employee.model.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

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
public class Employee {

	private int empId;				
	private String jobCode;					
	private String rightNo;				
	private String deptCode;
	private String jobName;					
	private String rightName;				
	private String deptName;
	private String salLevel;	
	/* @DateTimeFormat(pattern ="yyyy-MM-dd") */
	private Date hireDate;
	private Date modifyDate;
	private Date endDate;
	private String status;
	
	
	
	

}
