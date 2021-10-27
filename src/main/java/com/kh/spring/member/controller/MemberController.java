package com.kh.spring.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.BadSqlGrammarException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.kh.spring.member.model.service.MemberService;
import com.kh.spring.member.model.vo.Member;

@SessionAttributes("loginUser")	//model 객체에 loginUser 라는 key 값으로 객체가 추가되면 자동으로 세션에 추가해주는 어노테이션
@Controller	//bean scan을 통해서 자동으로 컨트롤러 타입으로 등록
public class MemberController {
	
	
	
	@Autowired //빈 스캐닝을 통해 인터페이스(memberService)를 구현한 클래스(구현체) 중에 @Service로 등록되어 있는 빈(MemberServiceImpl)을 찾아서 자동으로 주입
	private MemberService memberService;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@RequestMapping("main.xnags")
	public String loginMember(Member m, Model model) {
		
		Member loginUser;
		try {
			loginUser = memberService.loginMember(m);
			System.out.println("loginUser"+loginUser);
			model.addAttribute("loginUser", loginUser);	//model의 스코프는 request
			return "main";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg","로그인 실패");
			return "common/errorPage";
		}		 
	}	
	
	@RequestMapping("myPage.me")
	public String myPage() {
		return "member/myPage";
	}
	@RequestMapping("update.me")
	public String updateMember(@ModelAttribute Member m, @RequestParam("post") String post,
								 @RequestParam("address1") String address1,
								 @RequestParam("address2") String address2,
								 HttpSession session, Model model) throws Exception {
		m.setAddress(post+"/"+address1+"/"+address2);
		
		Member userInfo = memberService.updateMember(m);
		
		
		model.addAttribute("loginUser", userInfo);
		return "member/myPage";
	}
	/*
	//로그아웃 변경 (@SessionAttributes)
	@RequestMapping("logout.me")
	public String logoutMember(SessionStatus status) {
		status.setComplete(); //현재 컨트롤러에 @SessionAttributes 에 의해 저장된 Object를 제거
		return "redirect:/";
	}
	
	@RequestMapping("enrollForm.me")
	public String enrollForm() {
		return "member/memberEnrollForm";
	}
	
	@RequestMapping("insert.me")
	public String insertMember(@ModelAttribute Member m, @RequestParam("post") String post,
														 @RequestParam("address1") String address1,
														 @RequestParam("address2") String address2,
														 HttpSession session) {
		m.setAddress(post+"/"+address1+"/"+address2);
		//솔팅기법
		System.out.println("암호화전 : "+m.getUserPwd());
		String encPwd = bCryptPasswordEncoder.encode(m.getUserPwd());
		System.out.println("암호화후 : "+encPwd);
		m.setUserPwd(encPwd);
		memberService.insertMember(m);
		System.out.println(m);
		
		session.setAttribute("msg", "회원가입 성공");
		return "redirect:/";
		
	}
	
	
	
	@RequestMapping("myPage.me")
	public String myPage() {
		return "member/myPage";
	}
	
	
	@RequestMapping("updatePwd.me")
	public String updatePwd(@ModelAttribute Member m, 
								 HttpSession session, Model model) throws Exception {
		
		System.out.println("암호화전 : "+m.getUserPwd());
		String encPwd = bCryptPasswordEncoder.encode(m.getUserPwd());
		System.out.println("암호화후 : "+encPwd);
		m.setUserPwd(encPwd);
		
		Member userInfo = memberService.updatePwd(m);
		System.out.println("변경 : "+m.getUserPwd());
		
		model.addAttribute("loginUser", userInfo);
		
		return "redirect:/";
	}
	
	@RequestMapping("delete.me")
	public String deleteMember(String userId) {
		memberService.deleteMember(userId);
		return "redirect:logout.me";
	}*/
	
}
