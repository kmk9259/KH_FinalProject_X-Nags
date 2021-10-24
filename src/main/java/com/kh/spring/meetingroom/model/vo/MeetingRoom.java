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
	private String roomNo;
	private String empId;
	private Date date;
	private Timestamp timeIn;
	private Timestamp timeOut;
	private String status;
}
