package com.kh.spring.approval.model.vo;

import java.util.Date;

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
	private int midStatus;
	private int finStatus;
	private String title;
	private String content;
	private Date writeDate;
	private Date stayDate;
	private Date endDate;
	private String midReply;
	private String finReply;
	
	//private String startDate;
	//private String appDate;
	
	private String originName;
	private String changeName;
	


	
}
