package com.kh.spring.approval.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Spliterator;

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
import com.kh.spring.common.PaginationMail;
import com.kh.spring.common.exception.CommException;
import com.kh.spring.mail.model.vo.PageInfo;
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
			@RequestParam(name = "date", required = true) String date) {

		if (!file.getOriginalFilename().equals("")) {
			String changeName = saveFile(file, request);

			if (changeName != null) {
				app.setOriginName(file.getOriginalFilename());
				app.setChangeName(changeName);
			}
		}

		if (app.getCategory() == 1) {

			if (date.length() > 10) {
				System.out.println("여러날 : " + date);

				String[] str = date.split(" - ");
				System.out.println(str[0]);
				System.out.println(str[1]);

				app.setStartDate(str[0]);
				app.setAppDate(str[1]);

			} else {
				System.out.println("하루 : " + date);
				app.setAppDate(date);
			}

		} else {

			System.out.println("하루 : " + date);
			app.setAppDate(date);
		}

		approvalService.insertApproval(app);
		session.setAttribute("msg", "결재를 성공적으로 전송했습니다.");

		return "main";
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

	// 파일 저장
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

	// 진행중 결재함
	@RequestMapping("apping.ap")
	public String selectApprovalList(
			@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage, Model model,
			HttpServletRequest request) {

		Member mem = (Member) request.getSession().getAttribute("loginUser");

		int listCount = approvalService.selectApprovalListCount(mem.getEmpId());

		PageInfo pi = PaginationMail.getPageInfo(listCount, currentPage, 10, 10);

		ArrayList<Approval> appList = approvalService.selectApprovalList(pi, mem.getEmpId());

		model.addAttribute("appList", appList);
		model.addAttribute("pi", pi);

		return "approval/processingAppListView";
	}

	// 진행중 결재함 보기
	@RequestMapping("appingDetail.ap")
	public ModelAndView selectProcessingApproval(int ano, ModelAndView mv) {

		return mv;
	}

	// 결재 요청함
	@RequestMapping("askapp.ap")
	public String selectAskApprovalList(
			@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage, Model model,
			HttpServletRequest request) {

		Member mem = (Member) request.getSession().getAttribute("loginUser");

		int listCount = approvalService.selectAskApprovalListCount(mem.getEmpId());

		PageInfo pi = PaginationMail.getPageInfo(listCount, currentPage, 10, 10);

		ArrayList<Approval> appList = approvalService.selectAskApprovalList(pi, mem.getEmpId());

		model.addAttribute("appList", appList);
		model.addAttribute("pi", pi);


		return "approval/askAppListView";
	}

}
