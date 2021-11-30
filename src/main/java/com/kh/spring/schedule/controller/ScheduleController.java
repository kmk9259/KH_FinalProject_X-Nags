package com.kh.spring.schedule.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.spring.member.model.vo.Member;
import com.kh.spring.schedule.model.service.ScheduleService;
import com.kh.spring.schedule.model.vo.ConvertScheduleVo;
import com.kh.spring.schedule.model.vo.ResultVo;
import com.kh.spring.schedule.model.vo.Schedule;

@Controller
public class ScheduleController {
	@Autowired 
	private ScheduleService scheduleService;
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

	//리사이즈, 드롭(드래그)
	
	// 일정관리 페이지 들어가기
	@RequestMapping("main.sc")
	public String scheduleMain(Model m, HttpServletRequest request) {
		Member mem = (Member) request.getSession().getAttribute("loginUser");
		
		m.addAttribute("username", mem.getUserName());
		m.addAttribute("empId", mem.getEmpId());
		if ( Objects.isNull(mem) ) {
			return "/";
		}
		
		return "schedule/scheduleMain";
	}
	
	// 일정 불러오기
	@ResponseBody
	@RequestMapping(value="mainSelect", method=RequestMethod.POST)
	public ResultVo scheduleMainSelect(@RequestBody Schedule sc, Model m, HttpServletRequest request) {
		Member mem = (Member) request.getSession().getAttribute("loginUser");
		Map<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("scheduleStart", sc.getScheduleStart());
		paramMap.put("scheduleEnd", sc.getScheduleEnd());
		paramMap.put("empId", mem.getEmpId());
		
		ResultVo resultVo = new ResultVo();

		try {
			ArrayList<Schedule> scheduleList = scheduleService.scheduleMain(paramMap);
			resultVo.setData(convertData(scheduleList,mem));
			resultVo.setStatus(HttpStatus.OK);
		}
		catch (Exception e) {
			resultVo.setStatus(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return resultVo;
	}
	//이름 일치용 컨버터
	public List<ConvertScheduleVo> convertData(List<Schedule> scheduleList, Member member) {
		List<ConvertScheduleVo> resultList = new ArrayList<>();
		
		for ( Schedule oneSchedule : scheduleList ) {
			ConvertScheduleVo one = new ConvertScheduleVo();
			one.setScheduleNo(oneSchedule.getScheduleNo());
			one.set_id(oneSchedule.getEmpId());
			one.setTitle(oneSchedule.getScheduleTitle());
			one.setDescription(oneSchedule.getScheduleDescription());
			one.setStart(oneSchedule.getScheduleStart());
			one.setEnd(oneSchedule.getScheduleEnd());
			one.setType(String.valueOf(oneSchedule.getScheduleType()));
			one.setBackgroundColor(oneSchedule.getScheduleBackground());
			one.setUsername(member.getUserName());
		
			if( oneSchedule.getScheduleAllDay().equals("1") ) {
				one.setAllDay(true);
			}
			else {
				one.setAllDay(false);
			}
			resultList.add(one);
		}
		return resultList;
	}
	
	//시작날짜 데이터포맷
	public String getStartDate(Calendar cal, SimpleDateFormat sdf) {
		return sdf.format(cal.getTime());
	}
	// 종료날짜 데이터포맷
	public String getEndDate(Calendar cal, SimpleDateFormat sdf) {
		cal.add(Calendar.MONTH, 1);
		return sdf.format(cal.getTime());
	}
	
	//일정등록
	@ResponseBody
	@RequestMapping(value = "insertSchedule", method=RequestMethod.POST)
	public ResultVo insertSchedule(@RequestBody Schedule sc) {
		int result = scheduleService.insertSchedule(sc);
		ResultVo resultVo = new ResultVo();
		resultVo.setData(result);
		if ( result > 0 ) {
			resultVo.setStatus(HttpStatus.OK);
		}
		else {
			resultVo.setStatus(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return resultVo;
	}
	
	//일정수정
	@ResponseBody
	@RequestMapping(value = "updateSchedule", method=RequestMethod.POST)
	public ResultVo updateSchedule(@RequestBody Schedule sc) {
		int result = scheduleService.updateSchedule(sc);
		ResultVo resultVo = new ResultVo();
		resultVo.setData(result);
		if ( result > 0 ) {
			resultVo.setStatus(HttpStatus.OK);
		}
		else {
			resultVo.setStatus(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return resultVo;
	}
	
	//일정삭제
	@ResponseBody
	@RequestMapping(value = "deleteSchedule", method=RequestMethod.POST)
	public ResultVo deleteSchedule(@RequestBody Schedule sc) {
		int result = scheduleService.deleteSchedule(sc);
		ResultVo resultVo = new ResultVo();
		resultVo.setData(result);
		if ( result > 0 ) {
			resultVo.setStatus(HttpStatus.OK);
		}
		else {
			resultVo.setStatus(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return resultVo;
	}
	
	//리사이즈
	@ResponseBody
	@RequestMapping(value = "resizeUpdateSchedule", method=RequestMethod.POST)
	public ResultVo resizeUpdateSchedule(@RequestBody Schedule sc) {
		int result = scheduleService.resizeUpdateSchedule(sc);
		ResultVo resultVo = new ResultVo();
		resultVo.setData(result);
		if ( result > 0 ) {
			resultVo.setStatus(HttpStatus.OK);
		}
		else {
			resultVo.setStatus(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return resultVo;
	}
	
	//드롭
	@ResponseBody
	@RequestMapping(value = "dropUpdateSchedule", method=RequestMethod.POST)
	public ResultVo dropUpdateSchedule(@RequestBody Schedule sc) {
		int result = scheduleService.dropUpdateSchedule(sc);
		ResultVo resultVo = new ResultVo();
		resultVo.setData(result);
		if ( result > 0 ) {
			resultVo.setStatus(HttpStatus.OK);
		}
		else {
			resultVo.setStatus(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return resultVo;
	}
	
	//실험용
	public static void main(String[] args) {
		Calendar cal = Calendar.getInstance();
		cal.set(Calendar.DAY_OF_MONTH, 1);

		SimpleDateFormat sdfTest = new SimpleDateFormat("yyyy-MM-dd");
			
		ScheduleController test = new ScheduleController();
		String startDate =  test.getStartDate(cal, sdfTest);
		String endDate =  test.getEndDate(cal, sdfTest);
		
		System.out.println("startDate : " + startDate);
		System.out.println("endDate : " + endDate);

	}		
	
}
