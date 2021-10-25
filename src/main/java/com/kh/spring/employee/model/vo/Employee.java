package com.kh.spring.employee.model.vo;

import java.sql.Date;
import java.sql.Timestamp;

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
	/* 사원아이디(입사날짜+100)
		직급코드
		급여
		부서코드
		사원 이름
		주민번호
		급여등급
		권한번호
		입사일
		수정일
		퇴사일
	 * */
	private int empId;				
	private String jobCode;					
	private String rightNo;				
	private String deptCode;			
	private String empName;		
	private String empSsn;	
	private String salLevel;		
	private Date hireDate;
	private Date modifyDate;		
	private Date endDate;
	private String status;

}
