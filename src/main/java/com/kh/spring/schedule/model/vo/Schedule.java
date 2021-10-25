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
	private String deptCode;
	private String scheduleTitle;
	private Date scheduleStartDate;
	private Date scheduleEndDate;
	private Timestamp scheduleStartTime;
	private Timestamp scheduleEndTime;
	private String schedulePlace;
	private String scheduleContent;
	private int scheduleCategoryNo;
	private String scheduleAlarm;
	


}
