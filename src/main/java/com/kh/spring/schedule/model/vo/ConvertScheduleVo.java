package com.kh.spring.schedule.model.vo;

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
public class ConvertScheduleVo {
	private int scheduleNo;
	private String _id;
	private String title;
	private String description;
	private String start;
	private String end;
	private String type;
	private String backgroundColor;
	private String textColor;
	private String username;
	private boolean allDay;
}
