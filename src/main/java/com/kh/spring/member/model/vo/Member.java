package com.kh.spring.member.model.vo;

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
//위에 5가지를 @Data 하나로 붙여 사용할 수 있음
public class Member {
	private String userId;
	private String userPwd;
	private String userName;
	private String email;
	private String gender;
	//private int age;
	private String age; // 나중에 회원가입 시
	private String phone;
	private String address;
	private Date enrollDate;
	private Date modifyDate;
	private String status;
}
