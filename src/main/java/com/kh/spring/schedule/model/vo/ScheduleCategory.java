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
public class ScheduleCategory {
	
	private int scheduleCategoryNo;
	private String scheduleCategoryName;
	
}
