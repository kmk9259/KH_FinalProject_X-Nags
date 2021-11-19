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
public class TimeTable_A {

	private int taNo;
	private int mrNo;
	private String time;
	private String status;
	
	public TimeTable_A(int mrNo, String time, String status) {
		super();
		this.mrNo = mrNo;
		this.time = time;
		this.status = status;
	}
	

	
}
