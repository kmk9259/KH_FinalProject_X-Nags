package com.kh.spring.approval.controller;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.spring.approval.model.service.ApprovalService;
import com.kh.spring.approval.model.vo.Approval;
import com.kh.spring.common.PaginationApp;
import com.kh.spring.common.exception.CommException;
import com.kh.spring.employee.model.vo.Employee;
import com.kh.spring.holiday.model.vo.Holiday;
import com.kh.spring.approval.model.vo.PageInfo;
import com.kh.spring.member.model.vo.Member;

@Controller
public class ApprovalController {

	@Autowired
	private ApprovalService approvalService;

	// 증명서 신청 작성 폼 열기
	@RequestMapping("certificateForm.ap")
	public String requestCertificateForm() {
		return "approval/requestCertificateForm";
	}

	// 휴가 신청 작성 폼 열기
	@RequestMapping("holidayForm.ap")
	public String requestHolidayForm() {
		return "approval/requestHolidayForm";
	}

	// 연장근무 신청 작성 폼 열기
	@RequestMapping("overtimeForm.ap")
	public String requestOvertimeForm() {
		return "approval/requestOvertimeForm";
	}

	// 전자 결재 신청
	@RequestMapping("insert.ap")
	public String insertApproval(Approval app, HttpServletRequest request, HttpSession session, Model model,
			@RequestParam(name = "uploadFile", required = false) MultipartFile file,
			@RequestParam(name = "date", required = true) String date) throws ParseException {

		if (!file.getOriginalFilename().equals("")) {
			String changeName = saveFile(file, request);

			if (changeName != null) {
				app.setOriginName(file.getOriginalFilename());
				app.setChangeName(changeName);
			}
		}
		
		SimpleDateFormat sdf = new SimpleDateFormat("yy/MM/dd");
		
		Date sDate = null;
		Date eDate = null;
		
		Date oneDay = sdf.parse(date);

		if (app.getCategory() == 1) {

			if (date.length() > 10) {
				System.out.println("여러날 : " + date);

				String[] str = date.split(" - ");
				System.out.println("str[0] "+str[0]);
				System.out.println("str[1] "+str[1]);
				
				sDate = sdf.parse(str[0]);
				eDate = sdf.parse(str[1]);
				
				System.out.println("그냥 바로 형변환 시도 ~~ " + sDate);
				System.out.println();
				
				app.setStayDate(sDate);
				app.setEndDate(eDate);
				
				/*
				 * app.setStartDate(str[0]); app.setAppDate(str[1]);
				 */

			} else {
				System.out.println("하루 : " + date);
				app.setStayDate(null);
				app.setEndDate(oneDay);
			}

		} else {

			System.out.println("하루 : " + date);
			app.setEndDate(oneDay);
		}

		approvalService.insertApproval(app);
		session.setAttribute("msg", "결재를 성공적으로 전송했습니다.");

		return "redirect:apping.ap";
		// 나중에 진행중 결재함으로 경로 바꾸기
	}

	/*
	 * // 휴가 신청
	 * 
	 * @RequestMapping("holiday.ap") public String insertHoliday(Approval app,
	 * HttpServletRequest request, Model model,
	 * 
	 * @RequestParam(name = "uploadFile", required = false) MultipartFile file,
	 * 
	 * @RequestParam(name = "date", required = false) String date) {
	 * 
	 * if (!file.getOriginalFilename().equals("")) { String changeName =
	 * saveFile(file, request);
	 * 
	 * if (changeName != null) { app.setOriginName(file.getOriginalFilename());
	 * app.setChangeName(changeName); } }
	 * 
	 * if (app.getCategory() == 1) {
	 * 
	 * if (date.length() > 10) { System.out.println("여러날 : " + date);
	 * 
	 * String[] str = date.split(" - "); System.out.println(str[0]);
	 * System.out.println(str[1]);
	 * 
	 * app.setStartDate(str[0]); app.setAppDate(str[1]);
	 * 
	 * } else { System.out.println("하루 : " + date); app.setAppDate(date); }
	 * 
	 * }
	 * 
	 * approvalService.insertHoliday(app);
	 * 
	 * return null; }
	 */

	//파일 저장
	private String saveFile(MultipartFile file, HttpServletRequest request) {

		String resources = request.getSession().getServletContext().getRealPath("resources");
		String savePath = resources + "\\approval_files\\";

		String originalName = file.getOriginalFilename();
		
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());

		String ext = originalName.substring(originalName.lastIndexOf("."));
		String changeName = currentTime + ext;

		try {
			file.transferTo(new File(savePath + changeName));

		} catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new CommException("file upload error");
			// 에러가 났을 때 업로드를 시킬건지 말지 설계 시 결정
		}

		return changeName;
	}

	//진행중 결재함
	@RequestMapping("apping.ap")
	public String selectApprovalList(
			@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage, Model model,
			HttpServletRequest request) {

		Member mem = (Member) request.getSession().getAttribute("loginUser");

		int listCount = approvalService.selectApprovalListCount(mem.getEmpId());

		PageInfo pi = PaginationApp.getPageInfo(listCount, currentPage, 10, 10);

		ArrayList<Approval> appList = approvalService.selectApprovalList(pi, mem.getEmpId());

		model.addAttribute("appList", appList);
		model.addAttribute("pi", pi);

		return "approval/processingAppListView";
	}

	//진행중 결재함 보기
	@RequestMapping("appingDetail.ap")
	public ModelAndView selectProcessingApproval(int ano, ModelAndView mv) {

		return mv;
	}

	//결재 요청함
	@RequestMapping("askapp.ap")
	public String selectAskApprovalList(
			@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage, Model model,
			HttpServletRequest request) {

		Member mem = (Member) request.getSession().getAttribute("loginUser");

		int listCount = approvalService.selectAskApprovalListCount(mem.getEmpId());

		PageInfo pi = PaginationApp.getPageInfo(listCount, currentPage, 10, 10);

		ArrayList<Approval> appList = approvalService.selectAskApprovalList(pi, mem.getEmpId());
		
		model.addAttribute("appList", appList);
		model.addAttribute("pi", pi);


		return "approval/askAppListView";
	}
	
	//결재 요청 문서 보기
	@RequestMapping("askDetail.ap")
	public String selectAskApprovalDetail(int ano, Model model, HttpServletRequest request) {

		Approval app = approvalService.selectAskApprovalDetail(ano);
		
		Member mem = (Member) request.getSession().getAttribute("loginUser");
		
		//기안자, 결재자 정보
		Employee writer = approvalService.selectAppWriter(app.getEmpId());
		Employee mid = approvalService.selectAppMid(app.getAppMid());
		Employee fin = approvalService.selectAppFin(app.getAppFin());
		
		model.addAttribute("app", app);
		model.addAttribute("writer", writer);
		model.addAttribute("mid", mid);
		model.addAttribute("fin", fin);
		model.addAttribute("mem", mem);

		return "approval/askAppDetailView";
	}
	
	//중간결재승인
	@RequestMapping("midConfirm.ap")
	public ModelAndView midConfirm(int ano, String midReply, ModelAndView mv, HttpServletRequest request, HttpSession session) {
		
		Approval app = approvalService.selectAskApprovalDetail(ano);
		
		app.setMidReply(midReply);
		
		approvalService.midConfirm(app);
		
		session.setAttribute("msg", "결재를 승인하였습니다.");
		
		mv.addObject("ano", app.getAppNo()).setViewName("redirect:askDetail.ap");
		
		return mv;
	}
	
	//중간결재반려
	@RequestMapping("midReject.ap")
	public ModelAndView midReject(int ano, String midReply, ModelAndView mv, HttpServletRequest request, HttpSession session) {
		
		Approval app = approvalService.selectAskApprovalDetail(ano);
		
		app.setMidReply(midReply);
		
		approvalService.midReject(app);
		
		session.setAttribute("msg", "결재를 반려하였습니다.");
		
		mv.addObject("ano", app.getAppNo()).setViewName("redirect:askDetail.ap");
		
		return mv;
	}
	
	//최종결재승인
	@RequestMapping("finConfirm.ap")
	public ModelAndView finConfirm(int ano, String finReply, int category, ModelAndView mv, HttpServletRequest request, HttpSession session) {
		
		Approval app = approvalService.selectAskApprovalDetail(ano);
		
		app.setFinReply(finReply);
		
		Holiday hol = null;
		
		if(category == 1) {
			//휴가일수계산
			//하루휴가
			if(app.getStayDate() != null) {
				
				hol.setEmpId(app.getEmpId());
				hol.setHolidayName("연차");
				hol.setHolEndDay(app.getEndDate());
				hol.setHolDays(1);
			
			//휴가가 여러일일때
			}else{
				
				long diff = app.getEndDate().getTime() - app.getStayDate().getTime();
				int diffDays = Long.valueOf(diff / (24 * 60 * 60 * 1000)).intValue();

				hol.setEmpId(app.getEmpId());
				hol.setHolidayName("연차");
				hol.setHolStartDay(app.getStayDate());
				hol.setHolEndDay(app.getEndDate());
				hol.setHolDays(diffDays);
			}
		
		//반차
		}else if(category == 2) {
			
			hol.setEmpId(app.getEmpId());
			hol.setHolidayName("반차");
			hol.setHolEndDay(app.getEndDate());
			hol.setHolDays(1);
		}
		
		approvalService.insertOneDay(hol);
		approvalService.finConfirm(app);
		
		session.setAttribute("msg", "결재를 승인하였습니다.");
		
		mv.addObject("ano", app.getAppNo()).setViewName("redirect:askDetail.ap");
		
		return mv;
		
	}
	
	//최종결재반려
	@RequestMapping("finReject.ap")
	public ModelAndView finReject(int ano, String finReply, ModelAndView mv, HttpServletRequest request, HttpSession session) {
		Approval app = approvalService.selectAskApprovalDetail(ano);
		
		app.setFinReply(finReply);
		
		approvalService.finReject(app);
		
		session.setAttribute("msg", "결재를 반려하였습니다.");
		
		mv.addObject("ano", app.getAppNo()).setViewName("redirect:askDetail.ap");
		
		return mv;
	}
	
	

}
