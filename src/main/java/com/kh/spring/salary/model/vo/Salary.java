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
	/* 급여등급
		최소급여
		보너스
		식대
		소득세
		고용보험
		국민연금
		건강보험
		월급
	 * */				
	private String salLevel;					
	private String empId;			
	private int commission;
	private int meal;
	private int incomeTax;
	private int empInsurance;
	private int retirement;
	private int healthInsurance;
	private int total;

}
