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
	public ModelAndView insertSupplies(int empId, ModelAndView mv, Supplies supplies, HttpServletRequest req)
   {
		
		suppliesService.insertSupplies(supplies);
			
		ArrayList<Return> returnList = suppliesService.updateForm(empId);
		
		mv.addObject("returnList", returnList).setViewName("supplies/updateSupplies");
		
		return mv;
		
	}
	
	
	//업데이트 폼으로 넘기는 supplies list
	@RequestMapping("updateSupForm.su")
	public ModelAndView updateForm(int empId, ModelAndView mv) {
		
		ArrayList<Return> returnList = suppliesService.updateForm(empId);
		
		System.out.println(" ???? " + returnList);
		
		mv.addObject("returnList", returnList).setViewName("supplies/updateSupplies");
		
		
		return mv;
	}
	
	@RequestMapping("updateDate.su")
	public String updateSupplies(int empId, int reNo, Return re, ModelAndView mv, HttpServletRequest request, Model model ) {
		
		Return returnInfo = suppliesService.updateSupplies(re);
		
		ArrayList<Return> returnList = suppliesService.updateForm(reNo);
		
		
		System.out.println(" returnInfo " + returnInfo);
		
		model.addAttribute("returnInfo", returnInfo);
		
		//for(int i =0; i<returnList.size(); i++) {
		//	mv.addObject("reno", returnList.get(i).getReNo()).setViewName("supplies/updateSupplies");
		//	System.out.println(" reno 순차적으로 필요!" + returnList.get(i).getReNo());
			mv.addObject("returnList", returnList).setViewName("supplies/updateSupplies");
			
		//}
		
		
		
		return "member/myPage";
		
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
