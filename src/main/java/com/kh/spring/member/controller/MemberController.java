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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;

import com.kh.spring.approval.model.service.ApprovalService;
import com.kh.spring.approval.model.vo.Approval;
import com.kh.spring.attendance.model.service.AttendanceService;
import com.kh.spring.attendance.model.vo.Attendance;
import com.kh.spring.common.exception.CommException;
import com.kh.spring.community.model.service.board.BoardService;
import com.kh.spring.community.model.service.notice.NoticeService;
import com.kh.spring.community.model.vo.Notice;
import com.kh.spring.employee.model.service.EmployeeService;
import com.kh.spring.employee.model.vo.Employee;
import com.kh.spring.mail.model.service.MailService;
import com.kh.spring.mail.model.vo.Mail;
import com.kh.spring.meetingroom.model.service.MeetingRoomService;
import com.kh.spring.meetingroom.model.vo.MeetingRoom;
import com.kh.spring.member.model.service.MemberService;
import com.kh.spring.member.model.vo.Member;
import com.kh.spring.schedule.model.service.ScheduleService;
import com.kh.spring.schedule.model.vo.Schedule;
import com.kh.spring.supplies.model.service.SuppliesService;
import com.kh.spring.supplies.model.vo.Return;
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
	
	@Autowired
	private MailService mailService;
	
	@Autowired
	private ApprovalService approvalService;
	
	@Autowired
	private NoticeService noticeService;
	   
	@Autowired
	private BoardService boardService;
	
	@Autowired
	private ScheduleService scheduleService;
	
	private Employee loginEmp;
	
	@RequestMapping("loginerror")
	public String loginerror() {
		return "redirect:/";
	}

	@RequestMapping("main.xnags")
	public String loginMember(Member m, String empId,Model model) {
		
		ArrayList<MeetingRoom> mroom = meetingRoomService.reservedMeeting(empId);
		model.addAttribute("mroom", mroom);
		
		ArrayList<Return> returnList = suppliesService.updateForm(empId);
	    model.addAttribute("returnList", returnList);
	    
	    System.out.println("메인에 왜 null? "+returnList);
	    
	    ArrayList<Notice> noticeToplist = noticeService.selectTopList();      
	    model.addAttribute("noticeToplist", noticeToplist);
	      
	    ArrayList<Notice> boardToplist = boardService.selectTopList();      
	    model.addAttribute("boardToplist", boardToplist);
		
		ArrayList<Mail> sendList = mailService.mainSendMailList(empId);
		model.addAttribute("sendList", sendList);
		
		ArrayList<Mail> receiveList = mailService.mainReceiveMailList(empId);
		model.addAttribute("receiveList", receiveList);
		
		ArrayList<Approval> appingList = approvalService.mainAppingList(empId);
		model.addAttribute("appingList", appingList);
		
		ArrayList<Approval> appAskList = approvalService.mainAppAskList(empId);
		model.addAttribute("appAskList", appAskList);
		
		ArrayList<Approval> appedList = approvalService.mainAppedList(empId);
		model.addAttribute("appedList", appedList);
		
		ArrayList<Schedule> scheduleList = scheduleService.scheduleList(empId);
		model.addAttribute("scheduleList", scheduleList);
		
		Member loginUser = null;
		ArrayList<Attendance> attCountList =null;
	      
	      try {
	         if(m== null) {   //얼굴인식 화면
	            loginUser = memberService.loginMember2(empId);
	            loginEmp = employeeService.loginEmployee(empId);
	            attCountList = attendanceService.attCountList(empId);
	            System.out.println("얼굴 인식 로그인 loginUser: "+loginUser);
	            System.out.println("얼굴 인식 로그인 loginEmp : "+loginEmp);
	            
	         }else {
	            loginUser = memberService.loginMember(bCryptPasswordEncoder,m);
	            loginEmp = employeeService.loginEmployee(m.getEmpId());
	            attCountList = attendanceService.attCountList(m.getEmpId());
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
			model.addAttribute("attCountList", attCountList);
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
		String dDay = "D + "+((gap / (24 * 60 * 60 * 1000))+1);
		System.out.println(dDay) ;
		return dDay;
		
	}
	@RequestMapping("generalLogin.me")
	public String generalLogin() {	
		return "member/login";
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
		
	    ArrayList<Return> returnList = suppliesService.updateForm(empId);
	    model.addAttribute("returnList", returnList);
		
		return "member/myPage";
	}
	@RequestMapping("update.me")
    public String updateMember(@ModelAttribute Member m, @RequestParam("post") String post,
                       String empId,
                          @RequestParam("address1") String address1,
                          @RequestParam("address2") String address2,
                          HttpServletRequest request,
                          HttpSession session, Model model,
                          @RequestParam(name="file", required=false) MultipartFile file) throws Exception {

       if(!file.getOriginalFilename().equals("")) {
          if(m.getChangeName() != null) {
             deleteFile(m.getChangeName(), request);
          }
          
          String changeName = saveFile(file,request);
          
          m.setOriginName(file.getOriginalFilename());
          m.setChangeName(changeName);
       }   
       
       
       m.setAddress(post+"/"+address1+"/"+address2);
       
       Member userInfo = memberService.updateMember(m);
       model.addAttribute("loginUser", userInfo);
       
       ArrayList<MeetingRoom> mroom = meetingRoomService.reservedMeeting(empId);
       model.addAttribute("mroom", mroom);
       
        ArrayList<Return> returnList = suppliesService.updateForm(empId);
        model.addAttribute("returnList", returnList);
       
       return "member/myPage";
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
	   
	   private void deleteFile(String fileName, HttpServletRequest request) {
	      
	      String resources = request.getSession().getServletContext().getRealPath("resources");
	      String savePath = resources+"\\profile_files\\";
	      
	      System.out.println("savePath : " + savePath);
	      
	      
	      File deleteFile = new File(savePath+ fileName);
	      
	      System.out.println("지우는 파일? " + deleteFile);
	      deleteFile.delete();
	      
	   }
	   

	

	
	
}
