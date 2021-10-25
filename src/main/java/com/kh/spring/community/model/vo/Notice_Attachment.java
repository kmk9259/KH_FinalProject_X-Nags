package com.kh.spring.community.model.vo;

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
public class Notice_Attachment {

	private int file_no;
	private int notice_no;
	private String origin_file;
	private String change_file;
	private String file_path;
	private Date upload_date;
	
}
