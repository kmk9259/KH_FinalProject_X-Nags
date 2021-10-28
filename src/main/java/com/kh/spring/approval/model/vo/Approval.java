package com.kh.spring.approval.model.vo;

import java.sql.Date;

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
public class Approval {
	
	private int appNo;
	private String empId;
	private int category;
	private String appMid;
	private String appFin;
	private int status;
	private String title;
	private String content;
	private Date writeDate;
	private Date appDate;
	private String midReply;
	private String finReply;
	
	private String originName;
	private String changeName;

	
}
