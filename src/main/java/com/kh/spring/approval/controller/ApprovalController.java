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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.spring.approval.model.service.ApprovalService;
import com.kh.spring.approval.model.vo.Approval;
import com.kh.spring.approval.model.vo.Outwork;
import com.kh.spring.approval.model.vo.PageInfo;
import com.kh.spring.common.PaginationApp;
import com.kh.spring.common.exception.CommException;
import com.kh.spring.employee.model.vo.Employee;
import com.kh.spring.holiday.model.vo.Holiday;
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

	// 외근 신청 작성 폼 열기
	@RequestMapping("overtimeForm.ap")
	public String requestOvertimeForm() {
		return "approval/requestOutsideWorkForm";
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

				String[] str = date.split(" - ");
				
				sDate = sdf.parse(str[0]);
				eDate = sdf.parse(str[1]);
				
				app.setStayDate(sDate);
				app.setEndDate(eDate);
				
				
			} else {
				app.setStayDate(oneDay);
				app.setEndDate(oneDay);
			}

		} else {

			app.setStayDate(oneDay);
			app.setEndDate(oneDay);
		}

		approvalService.insertApproval(app);
		session.setAttribute("msg", "결재를 성공적으로 전송했습니다.");

		return "redirect:apping.ap";
	}

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
			
			e.printStackTrace();
			throw new CommException("file upload error");
			
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

	//작성결재문서보기
	@RequestMapping("appingDetail.ap")
	public String selectApprovalDetail(int ano, Model model, HttpServletRequest request) {
		
		Approval app = approvalService.selectApprovalDetail(ano);
		
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
		
		return "approval/processingAppDetailView";
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
	public ModelAndView finConfirm(int ano, String finReply, int category, String empId, ModelAndView mv, HttpServletRequest request, HttpSession session) {
		
		Approval app = approvalService.selectAskApprovalDetail(ano);
		
		app.setFinReply(finReply);
		
		Holiday hol = new Holiday();
		Outwork out = new Outwork();
		
		if(category == 1) {
			//휴가일수계산
			//하루휴가
			if(app.getStayDate() == app.getEndDate()) {
				
				hol.setEmpId(app.getEmpId());
				hol.setHolidayName("연차");
				hol.setHolStartDay(app.getEndDate());
				hol.setHolEndDay(app.getEndDate());
				hol.setHolDays(1.0);
				
				//연차 감소
				approvalService.decreaseCount(hol);
				
				//휴가 추가
				hol.setAppNo(ano);
				approvalService.insertHoliday(hol);
			
			//휴가가 여러일일때
			}else{
				
				//종료일과 시작일 사이의 차이 계산
				long diff = app.getEndDate().getTime() - app.getStayDate().getTime();
				int diffDays = Long.valueOf(diff / (24 * 60 * 60 * 1000)).intValue() +1;
				
				hol.setEmpId(empId);
				hol.setHolidayName("연차");
				hol.setHolStartDay(app.getStayDate());
				hol.setHolEndDay(app.getEndDate());
				hol.setHolDays(diffDays*1.0);
				
				//연차 감소
				approvalService.decreaseCount(hol);
				
				//휴가 추가
				hol.setAppNo(ano);
				approvalService.insertHoliday(hol);
			}
		
		//반차
		}else if(category == 2) {
			
			hol.setEmpId(empId);
			hol.setHolidayName("반차");
			hol.setHolStartDay(app.getEndDate());
			hol.setHolEndDay(app.getEndDate());
			hol.setHolDays(0.5);
			
			//연차 감소
			approvalService.decreaseCount(hol);
			
			//휴가 추가
			hol.setAppNo(ano);
			approvalService.insertHoliday(hol);
		
		//외근
		}else if(category == 3){
			
			out.setAppNo(ano);
			out.setEmpId(empId);
			out.setOutDate(app.getEndDate());
			
			//외근내역추가
			approvalService.insertOutwork(out);
			
		}
		
		//결재 승인
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
		//최종반려된건 완료결재함으로 경로를 바꿔야할거같음
		return mv;
	}
	
	//승인전 문서 수정 폼
	@RequestMapping("change.ap")
	public String changeApprovalForm(int ano, int category, Model model, HttpServletRequest request) {
		//밑으로 수정
		
		Approval app = approvalService.selectApprovalDetail(ano);
		
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
		
		if(category == 1 || category == 2) {
			return "approval/changeRequestHolidayForm";
			
		}else if(category == 3) {
			return "approval/changeRequestOutworkForm";
		
		}else {
			return "approval/changeRequestCertificateForm";
			
		}
	}
	
	//승인전 문서 수정
	@RequestMapping("update.ap")
	public String changeApproval(Approval app, Model m, HttpServletRequest request, HttpSession session,
			@RequestParam(name="reUploadFile", required=false) MultipartFile file,
			@RequestParam(name="reDate", required=false) String reDate,
			@RequestParam(name="category", required=true) int category) throws ParseException {
		
		if(!file.getOriginalFilename().equals("")) { 
			
			if(app.getChangeName() != null) {
				deleteFile(app.getChangeName(), request);
			}
			
			String changeName = saveFile(file, request);
			app.setOriginName(file.getOriginalFilename());
			app.setChangeName(changeName);
			
		}
		SimpleDateFormat sdf = new SimpleDateFormat("yy/MM/dd");
		
		Date sDate = null;
		Date eDate = null;
		
		Date oneDay = null;
		
		//날짜를 변경한 경우
		if(reDate.length() > 7) {
			
			//휴가인 경우
			if (category == 1) {
				
				//휴가가 하루가아닌경우
				if (reDate.length() > 10) {
					
					String[] str = reDate.split(" - ");
					
					sDate = sdf.parse(str[0]);
					eDate = sdf.parse(str[1]);
					
					app.setStayDate(sDate);
					app.setEndDate(eDate);
					
				//휴가가 하루인 경우
				} else {
					
					oneDay = sdf.parse(reDate);
					
					app.setStayDate(oneDay);
					app.setEndDate(oneDay);
				}
			
			//휴가 외 다른 결재
			} else {
				
				oneDay = sdf.parse(reDate);

				app.setEndDate(oneDay);
			}
		
		//날짜안바꿀때	
		}
		
		approvalService.updateApproval(app);
		
		session.setAttribute("msg", "결재를 성공적으로 수정했습니다.");

		return "redirect:apping.ap";
	}
	
	//첨부파일 삭제
	private void deleteFile(String fileName, HttpServletRequest request) {
		
		String resources = request.getSession().getServletContext().getRealPath("resources");
		String savePath = resources+"\\approval_files\\";
		
		File deleteFile = new File(savePath+fileName);
		deleteFile.delete();
		
	}

	//승인 전 문서 삭제
	@RequestMapping("deleteApping.ap")
	public String deleteProcessingApproval(int ano, HttpServletRequest request, HttpSession session,
											String fileName) {
		
		approvalService.deleteProcessingApproval(ano);
		
		if(!fileName.equals("")) {
			deleteFile(fileName, request);
			
		}
		
		session.setAttribute("msg", "결재를 성공적으로 삭제하였습니다.");
		
		return "redirect:apping.ap";
	}
	
	//결재 완료 문서함
	@RequestMapping("apped.ap")
	public String selectProcessedAppList(@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage, Model model,
										HttpServletRequest request, HttpSession session){
		
		Member mem = (Member) request.getSession().getAttribute("loginUser");

		int listCount = approvalService.selectProcessedAppListCount(mem.getEmpId());

		PageInfo pi = PaginationApp.getPageInfo(listCount, currentPage, 10, 10);

		ArrayList<Approval> appList = approvalService.selectProcessedAppList(pi, mem.getEmpId());
		
		model.addAttribute("appList", appList);
		model.addAttribute("pi", pi);

		
		return "approval/processedAppListView";
	}
	
	//결재완료문서보기
	@RequestMapping("appedDetail.ap")
	public String selectProcessedAppDetail(int ano, Model model, HttpServletRequest request) {

		Approval app = approvalService.selectProcessedAppDetail(ano);
		
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

		return "approval/processedAppDetailView";
	}
	
	//결재완료문서 삭제
	@RequestMapping("deleteApped.ap")
	public String deleteProcessedApproval(int ano, int category, HttpServletRequest request, HttpSession session,
			String fileName) {
		
		Approval app = approvalService.selectProcessedAppDetail(ano);
		
		
		if(!fileName.equals("")) {
			deleteFile(fileName, request);
			
		}
		
		if(category == 1 || category == 2) {
			
			Holiday hol = approvalService.selectHoliday(ano);
			
			//연차 복구
			approvalService.increaseCount(hol);
			
			//휴가 삭제
			approvalService.deleteHoliday(ano);
			
		}else if(category == 3) {
			
			//외근내역 삭제
			approvalService.deleteOutwork(ano);
			
		}
		
		//결재문서 삭제
		approvalService.deleteProcessedApproval(ano);
		
		session.setAttribute("msg", "결재를 성공적으로 삭제하였습니다.");
		
		return "redirect:apped.ap";
		
	}
	
	//메인 요청결재함수
	@ResponseBody
	@RequestMapping("count.ap")
	public String selectCountNoApp(Model model, HttpServletRequest request) {
		
		Member mem = (Member) request.getSession().getAttribute("loginUser");
		
		int count = approvalService.selectCountNoApp(mem.getEmpId());
		
		return String.valueOf(count);
		
	}
}
