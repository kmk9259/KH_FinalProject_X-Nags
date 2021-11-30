package com.kh.spring.supplies.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.kh.spring.common.PaginationSup;
import com.kh.spring.supplies.model.vo.PageInfo;
import com.kh.spring.member.model.service.MemberService;
import com.kh.spring.member.model.vo.Member;
import com.kh.spring.supplies.model.service.SuppliesService;
import com.kh.spring.supplies.model.vo.Return;
import com.kh.spring.supplies.model.vo.Sitems;
import com.kh.spring.supplies.model.vo.Supplies;

@SessionAttributes("loginUser")	

@Controller
public class SuppliesController {

	@Autowired
	private SuppliesService suppliesService;
	
	
	@Autowired 
	private MemberService memberService;
	
	
	
	@RequestMapping("supplies.me")
	public String rentalSup(Model model) {
		
		ArrayList<Sitems> supList = suppliesService.selectSitems();
		
		model.addAttribute("supList", supList);
		
		return "supplies/supplies";
	}
	
	
	
	
	@RequestMapping("return.me")
	public String selectReSuplist(Model model) {
		

		ArrayList<Return> returnList = suppliesService.selectReSuplist();
		
		model.addAttribute("returnList", returnList);
		
		
		return "supplies/return";
	}
	
	@RequestMapping("insertSup.su")
	public ModelAndView insertSupplies(int empId, ModelAndView mv, Supplies supplies)

   {
		
		suppliesService.insertSupplies(supplies);
			
		ArrayList<Return> returnList = suppliesService.updateForm(empId);
		
		mv.addObject("returnList", returnList).setViewName("supplies/updateSupplies");
		
		return mv;
		
	}
	
	
	//업데이트 폼으로 넘기는 supplies list
	@RequestMapping("updateSupForm.su")
	public ModelAndView updateForm(String empId, ModelAndView mv) {
		
		ArrayList<Return> returnList = suppliesService.updateForm(empId);

		mv.addObject("returnList", returnList).setViewName("supplies/updateSupplies");
		
		
		return mv;
	}
	
	@RequestMapping("updateDate.su")
	public ModelAndView updateSupplies(int empId, Return re, ModelAndView mv, HttpServletRequest request, Model model ) {
		
		suppliesService.updateSupplies(re);
		mv.addObject("reNo", re.getReNo()).setViewName("member/myPage");
		
		
		//날짜 수정후 다시 목록 불러오기 리스트
		ArrayList<Return> returnList = suppliesService.updateForm(empId);
		mv.addObject("returnList", returnList).setViewName("supplies/updateSupplies");

		return mv;
		
	}
	
	@RequestMapping("returnSup.su")
	public String returnSup(int reNo, HttpServletRequest request, Model model) 
	{
		
	
		suppliesService.returnSup(reNo);
		
		ArrayList<Return> returnList = suppliesService.selectReSuplist();
		
		model.addAttribute("returnList", returnList);
		
		return "supplies/return";
	}

}
