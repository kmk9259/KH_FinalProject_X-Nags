package com.kh.spring.meetingroom.model.vo;

import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;

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
public class MeetingRoom {
	private int mroomNo;
	private int mrNo;
	private String empId;
	private String time;
	private String status;
	private String str;
	
	public MeetingRoom(int mrNo, String time, String status) {
		super();
		this.mrNo = mrNo;
		this.time = time;
		this.status = status;
	}
	
	
}
