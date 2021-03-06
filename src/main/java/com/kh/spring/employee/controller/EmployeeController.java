package com.kh.spring.employee.controller;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.spring.common.PaginationEmp;
import com.kh.spring.common.exception.CommException;
import com.kh.spring.employee.model.service.EmployeeService;
import com.kh.spring.employee.model.vo.Department;
import com.kh.spring.employee.model.vo.Employee;
import com.kh.spring.employee.model.vo.Job;
import com.kh.spring.employee.model.vo.PageInfo;
import com.kh.spring.employee.model.vo.Right;
import com.kh.spring.employee.model.vo.SalGrade;
import com.kh.spring.member.model.service.MemberService;
import com.kh.spring.member.model.vo.Member;
import com.kh.spring.salary.model.service.SalaryService;
import com.kh.spring.salary.model.vo.Salary;

@SessionAttributes("loginUser")	

@Controller
public class EmployeeController {

	@Autowired
	private EmployeeService employeeService;
	
	@Autowired 
	private MemberService memberService;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@Autowired
	private SalaryService salaryService;
	
	

	
	@RequestMapping("listEmp.me")
	public String selectList(@RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage, Model model) {
		/*
		 * 1.@RequestParam(value="currentPage") int currentPage -->?????? ???????????? ???????????? ??????(?????? ???????????? ?????????)
		 * 2.@RequestParam(value="currentPage", required=false) int currentPage
		 * 
		 * -->required : ?????? ??????????????? ???????????? ??????(true = ??????) 
		 * ????????? required = false ??? ???????????? ?????? ????????? ????????? ????????? ??????(null ??? ????????? ??? ??????.) 
		 * -->null ??? ????????? int ??? ????????? ??? ????????? ????????? ????????????. 
		 * 
		 * 3.@RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage)
		 * dafultValue : ???????????? ?????? null ??? ??????, ?????? ??????????????? ?????? ?????? ????????? ??? ??????.
		 * 
		 * */
		
		int listCount = employeeService.selectListCount();
		System.out.println(listCount);
		
		
		PageInfo pi = PaginationEmp.getPageInfo(listCount, currentPage, 10, 10);
		
		ArrayList<Employee> list = employeeService.selectList(pi);
		
		
		
		System.out.println(list);

		
		model.addAttribute("list", list);
		model.addAttribute("pi",pi);
		return "employee/listEmp";
		
	
	}
	
	
	
	
	@RequestMapping("enrollEmp.me")
	public String enrollFormT(Model model) {
		
		
		ArrayList<Job> jlist = employeeService.selectJlist();
		ArrayList<Department> dlist = employeeService.selectDlist();
		ArrayList<Right> rlist = employeeService.selectRlist();
		ArrayList<SalGrade> slist = employeeService.selectSlist();
		String nextEmp = employeeService.selectNextEmp();
		System.out.println("nextEmp : "+nextEmp);
		
		model.addAttribute("jlist", jlist);
		model.addAttribute("dlist", dlist);
		model.addAttribute("rlist", rlist);
		model.addAttribute("slist", slist);
		model.addAttribute("nextEmp", nextEmp);
		
		return "employee/enrollEmp";
	}
	
	
	@RequestMapping("insertEmp.me")
	public String insertEmp2(@ModelAttribute Employee emp, HttpSession session, @ModelAttribute Salary sal,
							 @ModelAttribute Member m, 
							 @RequestParam("post") String post,
							 @RequestParam("address1") String address1,
							 @RequestParam("address2") String address2,
							 HttpServletRequest request, Model model,
							 @RequestParam(name="uploadFile", required=false) MultipartFile file,
							 @RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage) {

		
		
		//?????? ??????
		employeeService.insertEmployee(emp);
		System.out.println("emp " + emp);
		
		
		
		
		
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
		//????????????
		System.out.println("???????????? : "+m.getUserPwd());
		String encPwd = bCryptPasswordEncoder.encode(m.getUserPwd());
		System.out.println("???????????? : "+encPwd);
		m.setUserPwd(encPwd);
		
		//???????????? ??????
		memberService.insertMember(m);
		System.out.println("m "+m);
		
		
		

		
		PageInfo pi = PaginationEmp.getPageInfo(listCount, currentPage, 10, 10);
		
		ArrayList<Employee> list = employeeService.selectList(pi);
		
		model.addAttribute("list", list);
		model.addAttribute("pi",pi);
		
		
		//???????????? ??????
		salaryService.insertSalary(sal);
		
		
		//session.setAttribute("msg", "?????? ?????? ??????");
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
	
	@RequestMapping("empDetail.me")
	public ModelAndView empPage(int empId, ModelAndView mv, Model model) {
		
		ArrayList<Job> jlist = employeeService.selectJlist();
		ArrayList<Department> dlist = employeeService.selectDlist();
		ArrayList<Right> rlist = employeeService.selectRlist();
		ArrayList<SalGrade> slist = employeeService.selectSlist();
		
		model.addAttribute("jlist", jlist);
		model.addAttribute("dlist", dlist);
		model.addAttribute("rlist", rlist);
		model.addAttribute("slist", slist);
		
		Employee emp = employeeService.selectEmp(empId);
		Member mem = memberService.selectMem(empId);
		Salary sal = salaryService.selectSal(empId);
		
		mv.addObject("emp", emp).setViewName("employee/empDetail");
		mv.addObject("mem", mem).setViewName("employee/empDetail");
		mv.addObject("sal", sal).setViewName("employee/empDetail");
		return mv;
	}
	
	@RequestMapping("updateEmpForm.me")
	public ModelAndView updateForm(int empId, ModelAndView mv, Model model) {
		
		ArrayList<Job> jlist = employeeService.selectJlist();
		ArrayList<Department> dlist = employeeService.selectDlist();
		ArrayList<Right> rlist = employeeService.selectRlist();
		ArrayList<SalGrade> slist = employeeService.selectSlist();
		
		model.addAttribute("jlist", jlist);
		model.addAttribute("dlist", dlist);
		model.addAttribute("rlist", rlist);
		model.addAttribute("slist", slist);

		
		Employee emp = employeeService.selectEmp(empId);
		Member mem = memberService.selectMem(empId);
		Salary sal = salaryService.selectSal(empId);
		
		System.out.println(" emp ? with empId " + emp );
		
		mv.addObject("emp", emp).setViewName("employee/empUpdateForm");
		mv.addObject("mem", mem).setViewName("employee/empUpdateForm");
		mv.addObject("sal", sal).setViewName("employee/empUpdateForm");
		
		
		return mv;
	}
	
	@RequestMapping("updateEmp.me")
	public ModelAndView updateEmp(Employee emp, Salary sal, ModelAndView mv, HttpServletRequest request, Model model) {
		
		Employee empInfo =  employeeService.updateEmp(emp);
		model.addAttribute("empInfo" , empInfo);
		
		Salary updateSal = salaryService.updateSal(sal);
		model.addAttribute("sal", updateSal);
		
		mv.addObject("empId", emp.getEmpId()).setViewName("redirect:empDetail.me");
		
		return mv;
		
		
	}
	
	@RequestMapping("deleteEmp.me")
	public String deleteEmp(int empId, HttpServletRequest request,
							@RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage, 
							Model model)
	{
		employeeService.deleteEmp(empId);
		

		
		int listCount = employeeService.selectListCount();
		System.out.println(listCount);
		
		
		PageInfo pi = PaginationEmp.getPageInfo(listCount, currentPage, 10, 10);
		
		ArrayList<Employee> list = employeeService.selectList(pi);
		
		
		
		System.out.println(list);

		
		model.addAttribute("list", list);
		model.addAttribute("pi",pi);
		
		
		return "employee/listEmp";
		//return "redirect:listEmp";
		
	}

}
