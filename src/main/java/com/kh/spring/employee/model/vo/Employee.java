package com.kh.spring.employee.model.vo;

import java.sql.Timestamp;
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

	private String empId;				
	private String jobCode;					
	private String rightNo;				
	private String deptCode;
	private String jobName;					
	private String rightName;				
	private String deptName;
	private String salLevel;
	private int holCount;
	
	/* @DateTimeFormat(pattern ="yyyy-MM-dd") */
	private Date hireDate;
	private Date modifyDate;
	private Date endDate;
	private String status;
	
	//Attendance 관련 속성
	private String userName;
	private Date attDate;
	private Timestamp attInTime;
	private Timestamp attOutTime;
	private String changeName;
	
	
	
	

}
