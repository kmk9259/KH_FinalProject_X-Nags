package com.kh.spring.member.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

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

import com.kh.spring.attendance.model.service.AttendanceService;
import com.kh.spring.attendance.model.vo.Attendance;
import com.kh.spring.employee.model.service.EmployeeService;
import com.kh.spring.employee.model.vo.Employee;

import com.kh.spring.employee.model.vo.PageInfo;
import com.kh.spring.meetingroom.model.service.MeetingRoomService;
import com.kh.spring.meetingroom.model.vo.MeetingRoom;

import com.kh.spring.member.model.service.MemberService;
import com.kh.spring.member.model.vo.Member;
import com.kh.spring.supplies.model.service.SuppliesService;
import com.kh.spring.supplies.model.vo.Supplies;

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
	
	@Autowired
	private SuppliesService suppliesService;
	
	@Autowired
	private MeetingRoomService meetingRoomService;
	
	private Employee loginEmp;
	
	@RequestMapping("loginerror")
	public String loginerror() {
		return "redirect:/";
	}

	@RequestMapping("main.xnags")
	public String loginMember(Member m, String empId,Model model) {
		
		ArrayList<MeetingRoom> mroom = meetingRoomService.reservedMeeting(empId);
		model.addAttribute("mroom", mroom);
		
		ArrayList<Supplies> sup = suppliesService.mySupList(empId);
		model.addAttribute("sup", sup);
		
		
		Member loginUser = null;
		
		try {
			if(m== null) {	//얼굴인식 화면
				loginUser = memberService.loginMember2(empId);
				loginEmp = employeeService.loginEmployee(empId);
				System.out.println("얼굴 인식 로그인 loginUser: "+loginUser);
				System.out.println("얼굴 인식 로그인 loginEmp : "+loginEmp);
				
			}else {
				loginUser = memberService.loginMember(bCryptPasswordEncoder,m);
				loginEmp = employeeService.loginEmployee(m.getEmpId());
				System.out.println("일반 로그인 loginUser: "+loginUser);
				System.out.println("일반 로그인 loginEmp : "+loginEmp);
			}
			
			ArrayList<Employee> list = employeeService.selectAllEmp();
			
			for(Employee e : list) {
				Attendance att = attendanceService.selectTime(e);
				if(att == null) {
					attendanceService.insertAllEmp(e.getEmpId());
				}
				
			}
			String dDay = dDAY(loginEmp);
			
			
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
		
		long gap = todayDate.getTime()-targetDate.getTime();
		String dDay = "D + "+((gap / (24 * 60 * 60 * 1000))+2);
		System.out.println(dDay) ;
		return dDay;
		
	}
	@RequestMapping("logout.me")
	public String logoutMember(SessionStatus status) {	
		Attendance att = attendanceService.selectTime(loginEmp);
		
		if(att.getAttOutTime() == null) {
			attendanceService.updateOuttime(loginEmp);
		}
		
		status.setComplete(); 
		return "redirect:/";
	}
	@RequestMapping("myPage.me")
	public String myPage(Model model, @RequestParam("empId") String empId, Supplies su) {
		
		ArrayList<MeetingRoom> mroom = meetingRoomService.reservedMeeting(empId);
		model.addAttribute("mroom", mroom);
		
		ArrayList<Supplies> sup = suppliesService.mySupList(empId);
		model.addAttribute("sup", sup);
		
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
	

	
	
}
