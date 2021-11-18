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
	private int userNo;
	private String empId;
	private String userPwd;
	private String userSsn;
	private String userName;
	private String email;
	private String phone;
	private String address;
	private String gender;
	private String status;
	private String originName;
	private String changeName;
	private int rightNo;
	
	
}
