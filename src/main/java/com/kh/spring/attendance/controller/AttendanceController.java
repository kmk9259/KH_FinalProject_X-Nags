package com.kh.spring.attendance.controller;


import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.gson.GsonBuilder;
import com.kh.spring.approval.model.vo.Outwork;
import com.kh.spring.attendance.model.service.AttendanceService;
import com.kh.spring.attendance.model.vo.AttStatus;
import com.kh.spring.attendance.model.vo.Attendance;
import com.kh.spring.common.exception.CommException;
import com.kh.spring.employee.model.service.EmployeeService;
import com.kh.spring.employee.model.vo.Employee;
import com.kh.spring.holiday.model.vo.Holiday;
import com.kh.spring.member.model.vo.Member;

@Controller
public class AttendanceController {
	@Autowired 
	private AttendanceService attendanceService;
	
	@Autowired 
	private EmployeeService employeeService;
	
	@ResponseBody
	@RequestMapping("attImage.att")
	public String saveCapture(@RequestParam HashMap<Object, Object> param,  MultipartHttpServletRequest filelist) {
	    //param  --> 넘어온 파라미터
	    //filelist --> 넘어온 파일 리스트
	    //MultipartFile로 이름을 주어서 따로 받을 수 있다. ajax로 file1로 보냈으니 받을 때 MultipartFile file1 이런식으로도 가능하다.
	    //MultipartHttpServletRequest로 받으면 한번에 객체를 통째로 받아서 나름 편하다.
	    Iterator<String> iter = filelist.getFileNames(); 
	    MultipartFile mfile = null; 
	    String fieldName = "";
	    String changeName="";
	    while (iter.hasNext()) { 
	        fieldName = (String) iter.next(); //파일이름, 위에서 file1과 file2로 보냈으니 file1, file2로 나온다.
	        mfile = filelist.getFile(fieldName);  //저장된 파일 객체
	        changeName = saveFile(mfile, filelist);
	        System.out.println(fieldName);
	    }
	    return changeName;
	}
	private String saveFile(MultipartFile file, HttpServletRequest request) {
		String resources = request.getSession().getServletContext().getRealPath("resources");
		String savePath = resources + "\\attCapture_files\\";
		System.out.println("savePath : " + savePath);

		String originName = file.getOriginalFilename();
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());

		String ext = originName.substring(originName.lastIndexOf("."));

		String changeName = currentTime + ext;
		System.out.println("changeName : "+changeName);
		try {
			file.transferTo(new File(savePath + changeName));
		} catch (IllegalStateException | IOException e) {

			e.printStackTrace();
			throw new CommException("File Upload Error");
		}
		return changeName;
	}
	//내 근태 현황 페이지
	@RequestMapping("attendanceMy.att")
	public String myAttendance(Model m, HttpServletRequest request) {
		Member mem = (Member) request.getSession().getAttribute("loginUser");
		Employee loginEmp = employeeService.loginEmployee(mem.getEmpId());
		ArrayList<Attendance> attMyList = attendanceService.selectAttMy(mem);
		
		System.out.println("attMyList :   "+attMyList);
		//아이디별 근태 총 카운트
		ArrayList<Attendance> attCountList = attendanceService.attCountList(mem.getEmpId());
		System.out.println("attCountList"+attCountList);
		

		
		m.addAttribute("attMyList",attMyList);
		m.addAttribute("attCountList",attCountList);
		m.addAttribute("loginEmp",loginEmp);
		return "attendance/attendanceMy";
	}
	//일별 근태 현황 페이지 
	@RequestMapping("attendanceDay.att")
	public String DayAttendance(Model model,HttpServletRequest request) {
		ArrayList<AttStatus> attList = attendanceService.selectAttStatus();
		Member m = (Member) request.getSession().getAttribute("loginUser");		
		Employee loginEmp = employeeService.loginEmployee(m.getEmpId());
		
		model.addAttribute("attList",attList);
		model.addAttribute("loginEmp",loginEmp);
		
		return "attendance/attendanceDay";
	}
	//월별 근태 현황 페이지 
	@RequestMapping("attendanceMonth.att")
	public String monthAttendance(Model model,HttpServletRequest request) {
		ArrayList<AttStatus> attList = attendanceService.selectAttStatus();
		Member m = (Member) request.getSession().getAttribute("loginUser");		
		Employee loginEmp = employeeService.loginEmployee(m.getEmpId());
		

		
		model.addAttribute("attList",attList);
		model.addAttribute("loginEmp",loginEmp);		
		return "attendance/attendanceMonth";
	}
	
	//출근 시간이 찍혀있다면 select 아니면 insert
	@ResponseBody 
	@RequestMapping(value="attTime.att", produces = "application/json; charset=utf-8")
	public String selectIntime(Employee emp) {
		
		Attendance att = attendanceService.selectTime(emp);
		
		if(att.getAttInTime()==null) {
			attendanceService.updateIntime(emp);
			att = attendanceService.selectTime(emp);
			attCheck(att);
			return new GsonBuilder().setDateFormat("yyyy-mm-dd").create().toJson(att);			
		}else {
			att = attendanceService.selectTime(emp);
			attCheck(att);
			return new GsonBuilder().setDateFormat("yyyy-mm-dd").create().toJson(att);
		}		
	}
	public void attCheck(Attendance att) {
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

		if(att.getAttStatusNo()==0)			//아직 근태가 정해지지 않았을 때
		{	
			//정상 및 출근
			attNormal(att);
			//결근
			attAbsence(att);
			
			
			//반차 : 휴가 신청 승인 후 4시간 근무하고 퇴근시간 찍히고 반차라고 업데이트해주기
			//조건 :empId가 holiday와 att랑 같아야 하고, holStartDay가 attDate랑 같아야 하며
					//attOutTime = attInTime + 4Hour;
			//연차 : 휴가 신청 승인 후 holStartDay에서 holEndDay만큼 연차라고 업데이트해주기
			//조건 : empId가 holiday와 att가 같고, holStartDay에서 holEndDay만큼 attDate에서
					// attInTime, attOutTime, attStatusNo 연차라고 바꿔주기
			//외근 : 외근 신청 승인 후 해당 날짜에 외근이라고 update해주기
					
		}else if(att.getAttStatusNo()==3) {
			//외근
			attOutwork(att);
			//반차, 연차
			attHoliday(att);			
		}
	}
	//정상 및 지각
	public Attendance attNormal(Attendance att) {
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String today = sdf.format(date);
		int attHour = Integer.parseInt(att.getAttInTime().substring(0, 2));
		
		if(att.getAttInTime() != null && att.getAttOutTime() !=null) 
		{
			//출근 시간이 오전 9시보다 이전이면
			if(attHour <9) 
			{
				System.out.println("현재 시각 : "+today.substring(11,19));
				System.out.println("정상입니다.");
				//정상
				att.setAttStatusNo(1);				
				attendanceService.updateStatus(att);
				System.out.println("정상 출근 (1) : "+att);
			}//출근 시간이 오전 9시보다 이후이면
			else 
			{
				System.out.println("현재 시각 : "+today.substring(11,19));
				System.out.println("지각입니다.");
				//지각
				att.setAttStatusNo(2);				
				attendanceService.updateStatus(att);
				System.out.println("지각 출근 (2): "+att);
			}
		}
		return att;		
	}
	//결근
	public Attendance attAbsence(Attendance att) {
		ArrayList<Attendance> absence = attendanceService.selectAbsence();
		if(absence != null) 
		{
			System.out.println("결근입니다.");
			//결근 absence
			for(Attendance a: absence) {
				a.setAttStatusNo(3);
				attendanceService.updateStatus(a);
				System.out.println("결근 (3): "+att);
			}
		}
		return att;
	}
	//외근
	public Attendance attOutwork(Attendance att) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		Outwork outwork = attendanceService.selectOutwork(att.getEmpId());
		
		if(outwork != null) 
		{	
			//외근 absence
			att.setAttDate(sdf.format(outwork.getOutDate()));
			att.setAttInTime("09:00:00");
			att.setAttOutTime("18:00:00");
			att.setAttStatusNo(4);
			attendanceService.updateOutwork(att);	
			System.out.println("외근  : "+att);
		}
		return att;
	}
	//반차, 연차
	public Attendance attHoliday(Attendance att) {
		ArrayList<Holiday> holiday = attendanceService.selectHoliday(att.getEmpId());
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		SimpleDateFormat todate = new SimpleDateFormat("yyyy-MM-dd");
		String today = sdf.format(date);
		String todayDate =today.substring(0,10);
		
		
		int attHour = Integer.parseInt(att.getAttInTime().substring(0, 2));
		
		
		for(Holiday h : holiday) 
		{	
			String holStartDay = sdf.format(h.getHolStartDay()).substring(0, 10);
			String holEndDay = sdf.format(h.getHolEndDay()).substring(0, 10);
			
			if(todayDate.equals(holStartDay) && h.getHolidayName().equals("반차")) 
			{
				String attOutTime = String.valueOf(attHour+4)+att.getAttInTime().substring(2, 8);
			
				att.setAttOutTime(attOutTime);
				att.setAttStatusNo(5);				
				attendanceService.updateHalfway(att);
				System.out.println("반차 : "+att);
			}
			else if(h.getHolidayName().equals("연차")) 
			{
				System.out.println("holStartDay" +holStartDay+"holEndDay"+holEndDay);
				int sDay = Integer.parseInt(holStartDay.substring(8, 10));
				int eDay = Integer.parseInt(holEndDay.substring(8, 10));
				String yMonth = holStartDay.substring(0, 8);
				if(todayDate.equals(todate.format(h.getHolStartDay()))) 
				{
					att.setAttInTime("연차");
					att.setAttOutTime("연차");
					att.setAttStatusNo(6);
					attendanceService.updateAnnual(att);
					
					System.out.println("오늘 날짜 update :"+att);
					for(int i=sDay+1 ; i<=eDay; i++) {
						System.out.println(yMonth+i);
						Attendance a = new Attendance();
						a.setEmpId(h.getEmpId());
						a.setAttDate(yMonth+i);
						a.setAttInTime("연차");
						a.setAttOutTime("연차");
						a.setAttStatusNo(6);
						attendanceService.insertAnnual(a);	
						System.out.println("연차 : "+a);
					}
				}					
			}
		}
		return att;
		
	}
	//일별 근태 현황 조회
	@ResponseBody
	@RequestMapping(value="selectAttDay.att", produces = "application/json; charset=utf-8")
	public String selectAttDay(String attDate, String orderBy, int attStatusNo) {
		
		Attendance att =null;
		att = new Attendance();
		att.setAttDate(attDate);
		att.setOrderBy(orderBy);
		att.setAttStatusNo(attStatusNo);
		ArrayList<Employee> attlist = attendanceService.selectAttDay(att);
		
			
		return new GsonBuilder().setDateFormat("yyyy-mm-dd").create().toJson(attlist);
	}
	
	//월별 근태 현황 조회
	@ResponseBody
	@RequestMapping(value="selectAttMonth.att", produces = "application/json; charset=utf-8")
	public String selectAttMonth(String attMonthDate, String orderBy, int attStatusNo) {
		
		Attendance att = new Attendance();
		att.setAttMonthDate(attMonthDate);
		att.setOrderBy(orderBy);
		att.setAttStatusNo(attStatusNo);
		System.out.println("att@@@ : "+att);
		ArrayList<Employee> attlist = attendanceService.selectAttMonth(att);
		System.out.println("attlist"+attlist);
		return new GsonBuilder().setDateFormat("yyyy-mm-dd").create().toJson(attlist);
	}
	
	//일별 근태 수정 (관리자)
	@RequestMapping("updateDay.att")
	public String updateDay(@RequestParam("empId") String empId,
							@RequestParam("attNo") int attNo,
							@RequestParam("attInTime") String attInTime,
							@RequestParam("attOutTime") String attOutTime) {
		
		Employee emp = new Employee();
		emp.setEmpId(empId); 
		emp.setAttNo(attNo);
		emp.setAttInTime(attInTime); 
		emp.setAttOutTime(attOutTime);
		attendanceService.updateDay(emp); 
		
		return "redirect:attendanceDay.att";
	}
	
	//월별 근태 현황 조회
	@ResponseBody
	@RequestMapping(value="deleteDay.att")
	public String deleteDay(int attNo) {
		
		attendanceService.deleteDay(attNo);
		
		return "redirect:attendanceDay.att";
		
	}
	//월별 근태 수정 (관리자)
		@RequestMapping("updateMonth.att")
		public String updateMonth(@RequestParam("empId") String empId,
								@RequestParam("attNo") int attNo,
								@RequestParam("attInTime") String attInTime,
								@RequestParam("attOutTime") String attOutTime) {
			
			Employee emp = new Employee();
			emp.setEmpId(empId); 
			emp.setAttNo(attNo);
			emp.setAttInTime(attInTime); 
			emp.setAttOutTime(attOutTime);
			System.out.println(emp);
			attendanceService.updateMonth(emp); 
			
			return "redirect:attendanceMonth.att";
		}
		
		//월별 근태 현황 조회
		@ResponseBody
		@RequestMapping(value="deleteMonth.att")
		public String deleteMonth(int attNo) {
			System.out.println("attNo : "+attNo);
			attendanceService.deleteMonth(attNo);
			
			return "redirect:attendanceMonth.att";
			
		}
}
