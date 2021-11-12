package com.kh.spring.supplies.model.vo;

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
public class Supplies {

	private String suppliesCode;
	private String empId;
	private String suppliesName;
	private int count;
	private Date startDate;
	private Date endDate;
	private String status;
}
