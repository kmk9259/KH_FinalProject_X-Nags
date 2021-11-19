package com.kh.spring.meetingroom.model.vo;

import java.sql.Date;


import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString
public class TimeTable_C {

	private int tcNo;
	private int mrNo;
	private String time;
	private String status;
	

	
}
