package com.kh.spring.schedule.model.vo;

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
public class Schedule {
	
	private int scheduleNo;
	private String empId;
	private String scheduleTitle;
	private Date scheduleStart;
	private Date scheduleEnd;
	private String scheduleDiscription;
	private int scheduleTypeNo;
	private String scheduleBackground;
	private String scheduleAllDay;
//	private String scheduleAlarm;
	
	private String userName;
	private String deptName;


}
