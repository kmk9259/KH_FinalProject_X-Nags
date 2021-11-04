package com.kh.spring.member.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;

import com.kh.spring.attendance.model.service.AttendanceService;
import com.kh.spring.attendance.model.vo.Attendance;
import com.kh.spring.common.PaginationEmp;
import com.kh.spring.common.exception.CommException;
import com.kh.spring.employee.model.service.EmployeeService;
import com.kh.spring.employee.model.vo.Employee;
import com.kh.spring.employee.model.vo.PageInfo;
import com.kh.spring.member.model.service.MemberService;
import com.kh.spring.member.model.vo.Member;

@SessionAttributes("loginUser")	

@Controller	//bean scan을 통해서 자동으로 컨트롤러 타입으로 등록
public class MemberController {

	@Autowired 
	private MemberService memberService;
	@Autowired 
	private EmployeeService employeeService;
	@Autowired 
	private AttendanceService attendanceService;
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	private Employee loginEmp;
	
	@RequestMapping("loginerror")
	public String loginerror() {
		return "redirect:/";
	}

	@RequestMapping("main.xnags")
	public String loginMember(Member m, Model model) {
		
		Member loginUser;
		
		
		try {
			loginUser = memberService.loginMember(bCryptPasswordEncoder,m);
			loginEmp = employeeService.loginEmployee(m);	

			String dDay = dDAY(loginEmp);
			System.out.println("loginUser: "+loginUser);
			System.out.println("loginEmp : "+loginEmp);
			
			model.addAttribute("loginUser", loginUser);	
			model.addAttribute("loginEmp", loginEmp);	
			
			model.addAttribute("dDay", dDay);
			
			return "main";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg","로그인 실패");
			return "common/errorPage";
		}		 
	}
	
	public String dDAY(Employee emp) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		Date targetDate = emp.getHireDate();
		
		Date todayDate = new Date();
		String todayDay = sdf.format(todayDate);
		
		long gap = targetDate.getTime() - todayDate.getTime();
		String dDay = "D + "+(-(gap / (24 * 60 * 60 * 1000)));
		System.out.println() ;
		return dDay;
		
	}
	@RequestMapping("logout.me")
	public String logoutMember(SessionStatus status) {	
		Attendance att = attendanceService.selectTime(loginEmp);
		
		if(att.getAttendanceOutTime() == null) {
			attendanceService.insertOuttime(loginEmp);
		}
		
		status.setComplete(); 
		return "redirect:/";
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
	
	
	@RequestMapping("insertMember.me")
	public String insertMember(@ModelAttribute Member m, @RequestParam("post") String post,
														 @RequestParam("address1") String address1,
														 @RequestParam("address2") String address2,
														 HttpSession session,
														 HttpServletRequest request, Model model,
														 @RequestParam(name="uploadFile", required=false) MultipartFile file,
														 @RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage) {
		
		
		System.out.println(m);
		System.out.println(file.getOriginalFilename());
		
		int listCount = employeeService.selectListCount();
		System.out.println(listCount);
		
		
		if(!file.getOriginalFilename().equals("")) {
			
			String changeName = saveFile(file, request);
			
			if(changeName != null) {
			m.setOriginName(file.getOriginalFilename());
			m.setChangeName(changeName);
			}
		}
		
		
		
		m.setAddress(post+"/"+address1+"/"+address2);
		//솔팅기법
		System.out.println("암호화전 : "+m.getUserPwd());
		String encPwd = bCryptPasswordEncoder.encode(m.getUserPwd());
		System.out.println("암호화후 : "+encPwd);
		m.setUserPwd(encPwd);
		memberService.insertMember(m);
		System.out.println(m);
		
		PageInfo pi = PaginationEmp.getPageInfo(listCount, currentPage, 10, 10);
		
		ArrayList<Employee> list = employeeService.selectList(pi);
		
		model.addAttribute("list", list);
		model.addAttribute("pi",pi);
		
		
		session.setAttribute("msg", "회원가입 성공");
		return "employee/listEmp";
		
	}
	
	private String saveFile(MultipartFile file, HttpServletRequest request) {

		String resources = request.getSession().getServletContext().getRealPath("resources");
		String savePath = resources+"\\profile_files\\";
		
		System.out.println("savePath : " + savePath);
		
		String originName = file.getOriginalFilename();
		
		String currentTime = new SimpleDateFormat("yyyMMddHHmmss").format(new Date());
		
		String ext = originName.substring(originName.lastIndexOf("."));
		
		String changeName = currentTime + ext;
		
		try {
			file.transferTo(new File(savePath + changeName));
		} catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new CommException("file upload error");
		}
		
		return changeName;
	}
	
}
