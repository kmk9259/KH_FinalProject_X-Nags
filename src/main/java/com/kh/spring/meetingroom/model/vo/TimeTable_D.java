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
public class TimeTable_D {

	private int tdNo;
	private int mrNo;
	private String time;
	private String status;
	

	
}
