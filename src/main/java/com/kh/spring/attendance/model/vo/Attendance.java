package com.kh.spring.attendance.model.vo;

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
public class Attendance {
	
	private int attendanceNo;				//근태 번호
	private String empId;					//사원 아이디
	private int attStatusNo;				//현황 번호
	private Date attendanceDate;			//날짜
	private Timestamp attendanceInTime;		//출근 시간
	private Timestamp attendanceOutTime;	//퇴근 시간
	
	private String attStatusName;
}
