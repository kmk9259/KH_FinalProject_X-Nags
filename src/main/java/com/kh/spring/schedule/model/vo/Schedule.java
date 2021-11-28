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
	private String scheduleStart;
	private String scheduleEnd;
	private String scheduleDescription;
	private int scheduleTypeNo;
	private String scheduleType;
	private String scheduleBackground;
	private String scheduleTextcolor;
	private String scheduleAllDay;
	private String userName;

}
