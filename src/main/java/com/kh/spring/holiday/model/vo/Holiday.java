package com.kh.spring.holiday.model.vo;

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
public class Holiday {
	/* 휴가 번호
		사원아이디
		휴가 종류
		시작 날짜
		종료날짜
		휴가 일수
		잔여 휴가
	 * */
	private int holidayNo;	
	private int appNo;
	private String empId;					
	private String holidayName;			
	private Date holStartDay;
	private Date holEndDay;		
	private Double holDays;
	
	

}
