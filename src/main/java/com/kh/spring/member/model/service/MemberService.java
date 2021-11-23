package com.kh.spring.member.model.service;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.kh.spring.member.model.vo.Member;

public interface MemberService {

	//Member loginMember(Member m) throws Exception;

	Member loginMember(BCryptPasswordEncoder bCryptPasswordEncoder, Member m);

	Member updateMember(Member m) throws Exception;

	void insertMember(Member m);

	Member loginMember2(String empId);
	
	Member selectMem(int empId);

	Member updatePic(Member m) throws Exception;

	//void deleteMember(String userId);

	//Member updatePwd(Member m) throws Exception;

	

}
