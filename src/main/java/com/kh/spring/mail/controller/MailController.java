package com.kh.spring.mail.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.spring.common.PaginationMail;
import com.kh.spring.common.exception.CommException;
import com.kh.spring.employee.model.vo.Employee;
import com.kh.spring.mail.model.service.MailService;
import com.kh.spring.mail.model.vo.Mail;
import com.kh.spring.mail.model.vo.PageInfo;
import com.kh.spring.member.model.vo.Member;

@Controller
public class MailController { 

	@Autowired
	private MailService mailService;

	// 메일 작성 폼 열기
	@RequestMapping("insertForm.ml")
	public String insertMailForm(Model m) {
		
		return "mail/mailInsertForm";
	}

	// 메일 작성하기
	@RequestMapping("insert.ml")
	public String insertMail(Mail m, HttpServletRequest request, HttpSession session,
			@RequestParam(name = "uploadFile", required = false) MultipartFile file) {

		if (!file.getOriginalFilename().equals("")) {
			String changeName = saveFile(file, request);

			if (changeName != null) {
				m.setOriginName(file.getOriginalFilename());
				m.setChangeName(changeName);
			}
		}

		mailService.insertMail(m);
		
		session.setAttribute("msg","메일을 성공적으로 전송했습니다.");

		return "redirect:sendList.ml";

	}

	// 파일 저장
	private String saveFile(MultipartFile file, HttpServletRequest request) {

		String resources = request.getSession().getServletContext().getRealPath("resources");
		String savePath = resources + "\\mail_files\\";

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

	// 보낸메일함
	@RequestMapping("sendList.ml")
	public String selectSendMailList(
			@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage, Model model,
			HttpServletRequest request) {

		Member mem = (Member) request.getSession().getAttribute("loginUser");

		int listCount = mailService.selectSendMailListCount(mem.getEmpId());

		PageInfo pi = PaginationMail.getPageInfo(listCount, currentPage, 10, 10);

		ArrayList<Mail> sendList = mailService.selectSendMailList(pi, mem.getEmpId());

		model.addAttribute("sendList", sendList);
		model.addAttribute("pi", pi);

		return "mail/sendMailListView";
	}

	// 보낸 메일 보기
	@RequestMapping("sendDetail.ml")
	public ModelAndView selectSendMail(int mno, ModelAndView mv) {

		Mail m = mailService.selectSendMail(mno);

		mv.addObject("m", m).setViewName("mail/sendMailDetailView");

		return mv;
	}

	// 받은 메일함
	@RequestMapping("receiveList.ml")
	public String selectReceiveMailList(
			@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage, Model model,
			HttpServletRequest request) {

		Member mem = (Member) request.getSession().getAttribute("loginUser");

		int listCount = mailService.selectReceiveMailListCount(mem.getEmpId());

		PageInfo pi = PaginationMail.getPageInfo(listCount, currentPage, 10, 10);

		ArrayList<Mail> receiveList = mailService.selectReceiveMailList(pi, mem.getEmpId());

		model.addAttribute("receiveList", receiveList);
		model.addAttribute("pi", pi);

		return "mail/receiveMailListView";
	}

	// 받은 메일 보기
	@RequestMapping("receiveDetail.ml")
	public String selectReceiveMail(int mno, Model model, HttpServletRequest request) {

		// 조회수 올려서 읽음처리하기
		Mail m = mailService.selectReceiveMail(mno);
		
		//보낸사람
		Member sendEmp = mailService.selectSendEmp(mno);
		
		model.addAttribute("sendEmp", sendEmp);
		model.addAttribute("m", m);

		return "mail/receiveMailDetailView";
	}

	// 보낸메일보기->메일다시보내기
	@RequestMapping("resend.ml")
	public String resendMail(@RequestParam(name = "mno") int mno) {

		// 보낸메일 가져오기
		Mail m = mailService.selectSendMail(mno);

		// 아이디 가져오기
		Member id = mailService.getReceiver(m.getReceiver());

		m.setTitle("[재전송] " + m.getTitle());
		m.setReceiver(id.getEmpId());

		mailService.resendMail(m);

		return "redirect:sendList.ml";
	}

	// 보낸메일 전달 화면
	@RequestMapping("sendDelivery.ml")
	public ModelAndView sendDelivery(Mail m, HttpServletRequest request,
			@RequestParam(name = "mno", required = false) int mno, ModelAndView mv) {

		Mail sendMail = mailService.selectSendMail(mno);

		mv.addObject("sendMail", sendMail).setViewName("mail/sendDeliveryForm");

		return mv;
	}
	
	// 받은메일 전달 화면
	@RequestMapping("receiveDelivery.ml")
	public String receiveDelivery(Mail m, HttpServletRequest request,
			@RequestParam(name = "mno", required = false) int mno, Model model) {

		Mail receiveMail = mailService.selectSendMail(mno);
		
		//보낸사람
		Member sendEmp = mailService.selectSendEmp(mno);

		model.addAttribute("receiveMail", receiveMail);
		model.addAttribute("sendEmp", sendEmp);

		return "mail/receiveDeliveryForm";
	}
	

	// 받은,보낸메일 전달
	@RequestMapping("insertDelivery.ml")
	public String insertSendDelivery(Mail m, HttpServletRequest request, HttpSession session,
			@RequestParam(name = "reUploadFile", required = false) MultipartFile file) {

		if (!file.getOriginalFilename().equals("")) {
			if (m.getChangeName() != null) {
				deleteFile(m.getChangeName(), request);
			}

			String changeName = saveFile(file, request);
			m.setOriginName(file.getOriginalFilename());
			m.setChangeName(changeName);
		}

		mailService.insertSendDelivery(m);
		
		session.setAttribute("msg","메일을 성공적으로 전달했습니다.");

		return "redirect:sendList.ml";
	}

	// 파일 지우기
	private void deleteFile(String fileName, HttpServletRequest request) {

		String resources = request.getSession().getServletContext().getRealPath("resources");
		String savePath = resources + "\\mail_files\\";

		File deleteFile = new File(savePath + fileName);
		deleteFile.delete();

	}

	// 보낸메일 휴지통으로 이동
	@RequestMapping("wasteSendMail.ml")
	public String wasteSendMail(@RequestParam(name = "mno") int mno, HttpSession session) {

		mailService.wasteSendMail(mno);
		
		session.setAttribute("msg","메일을 휴지통으로 이동했습니다.");
		
		return "redirect:sendList.ml";

	}

	// 휴지통 리스트
	@RequestMapping("waste.ml")
	public String selectWasteMailList(@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage, Model model,
										HttpServletRequest request) {
		
		Member mem = (Member) request.getSession().getAttribute("loginUser");

		int listCount = mailService.selectWasteMailListCount(mem.getEmpId());

		PageInfo pi = PaginationMail.getPageInfo(listCount, currentPage, 10, 10);

		ArrayList<Mail> wasteList = mailService.selectWasteMailList(pi, mem.getEmpId());

		model.addAttribute("wasteList", wasteList);
		model.addAttribute("pi", pi);
		
		return "mail/wasteMailListView";
	}
	
	//받은메일에 답장폼
	@RequestMapping("sendReply.ml")
	public String sendReply(Mail m, HttpServletRequest request,
			@RequestParam(name = "mno", required = false) int mno, Model model) {

		Mail receiveMail = mailService.selectReceiveMail(mno);
		
		//보낸사람
		Member sendEmp = mailService.selectSendEmp(mno);

		model.addAttribute("receiveMail", receiveMail);
		model.addAttribute("sendEmp", sendEmp);

		return "mail/replyForm";
	}
	
	//받은 메일 답장보내기
	@RequestMapping("insertReply.ml")
	public String insertReply(Mail m, HttpServletRequest request, HttpSession session,
								@RequestParam(name = "reUploadFile", required = false) MultipartFile file) {

		if (!file.getOriginalFilename().equals("")) {
			if (m.getChangeName() != null) {
				deleteFile(m.getChangeName(), request);
			}

			String changeName = saveFile(file, request);
			m.setOriginName(file.getOriginalFilename());
			m.setChangeName(changeName);
		}

		mailService.insertReply(m);
		
		session.setAttribute("msg","답장을 성공적으로 전송했습니다.");

		return "redirect:sendList.ml";
	}
	
	//받은메일보기에서 휴지통으로 이동
	@RequestMapping("wasteReceiveMail.ml")
	public String wasteReceiveMail(@RequestParam(name = "mno") int mno, HttpSession session) {

		mailService.wasteReceiveMail(mno);
		
		session.setAttribute("msg","메일을 휴지통으로 이동했습니다.");
		
		return "redirect:receiveList.ml";

	}
	
	//휴지통메일 보기
	@RequestMapping("wasteDetail.ml")
	public String selectWasteMail(int mno, Model model) {

		Mail m = mailService.selectSendMail(mno);
		
		//보낸사람
		Member sendEmp = mailService.selectSendEmp(mno);
		Member receiveEmp = mailService.selectReceiveEmp(mno);

		model.addAttribute("m", m);
		model.addAttribute("sendEmp", sendEmp);
		model.addAttribute("receiveEmp", receiveEmp);

		return "mail/wasteMailDetailView";
	}
	
	//휴지통에서 복구
	@RequestMapping("returnMail.ml")
	public String returnMail(int mno, String empId, HttpSession session) {

		Mail m = mailService.selectMail(mno);
		
		//작성자인경우
		if(m.getEmpId().equals(empId)) {
			
			mailService.returnSendMail(mno);
			
			session.setAttribute("msg","메일을 휴지통에서 복구했습니다.");
			
			return "redirect:sendList.ml";
			
		//수신자인경우
		}else{
			
			mailService.returnReceiveMail(mno);
			
			session.setAttribute("msg","메일을 휴지통에서 복구했습니다.");
			
			return "redirect:receiveList.ml";
			
		}
	}
	
	//휴지통에서 영구삭제
	@RequestMapping("wasteMail.ml")
	public String wasteMail(int mno, String empId, HttpSession session) {

		Mail m = mailService.selectSendMail(mno);
		
		//작성자인경우
		if(m.getEmpId().equals(empId)) {
			
			//수신자 상태확인
			if(m.getReceiverStatus() == 3) {
				
				mailService.wasteMail(mno);
				
			}else {
				
				mailService.updateWriter(mno);
				
			}
			
		//수신자인경우
		}else{
			
			//발신자상태확인
			if(m.getWriterStatus() == 3) {
				
				mailService.wasteMail(mno);
				
			}else {
				
				mailService.updateReceiver(mno);
				
			}
		}
		
		return "redirect:waste.ml";
		
	}
	
	//주소록 - 부서코드로 사원리스트 출력
	@ResponseBody
	@RequestMapping(value = "empList.ml", produces="application/json; charset=UTF-8")
	public String selectEmployeeList(String deptCode) {
		
		ArrayList<Employee> list = mailService.selectEmployeeList(deptCode);
		
		JSONArray jrr = new JSONArray();
		
		JSONObject obj = null;
		
		if(list != null) {
			for(Employee emp : list) {
				obj = new JSONObject();
				
				obj.put("userName", emp.getUserName());
				obj.put("empId", emp.getEmpId());
				obj.put("jobName", emp.getJobName());
				obj.put("rightName", emp.getRightName());
			 
				jrr.put(obj);
		 	}
		}
		
		JSONObject jsonMap = null;
		
		if(deptCode != null && jrr != null) {
			jsonMap = new JSONObject();
			
			jsonMap.put("jrr", jrr);
			jsonMap.put("deptCode", deptCode);
		}
		
		return jsonMap.toString();
	}
	
	//사이드바에서 안읽은 메일 개수 보여주기
	@ResponseBody
	@RequestMapping("count.ml")
	public String selectCountNoRead(Model model, HttpServletRequest request) {
		
		Member mem = (Member) request.getSession().getAttribute("loginUser");
		
		int count = mailService.selectCountNoRead(mem.getEmpId());
		
		return String.valueOf(count);
		
	}
	
}
