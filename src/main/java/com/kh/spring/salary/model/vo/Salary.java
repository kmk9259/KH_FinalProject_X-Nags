package com.kh.spring.salary.model.vo;

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
public class Salary {
	/* 급여번호
		급여등급
		사원번호
		기본급여
		보너스
		식대
		
		소득세
		고용보험
		국민연금
		건강보험
		사대보험 합
		실급여
	  */
	
	
	
	private String salLevel;					
	private String empId;			
	
	private String basic;
	private String commission;
	private String meal;
	private String total;
	private String incomeTax;
	private String empInsurance;
	private String retirement;
	private String healthInsurance;
	private String inTotal;
	private String subTotal;
	
	

}
