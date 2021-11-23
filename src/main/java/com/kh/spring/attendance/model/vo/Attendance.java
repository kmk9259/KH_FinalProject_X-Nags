package com.kh.spring.attendance.model.vo;


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

public class Attendance {
	
	private int attNo;				//근태 번호
	private String empId;					//사원 아이디
	private int attStatusNo;				//현황 번호
	
	private String attDate;			//날짜
	private String attMonthDate;
	private String attInTime;		//출근 시간
	private String attOutTime;	//퇴근 시간
	
	private String attStatusName;
	private String orderBy;
	
	private int count;
}
