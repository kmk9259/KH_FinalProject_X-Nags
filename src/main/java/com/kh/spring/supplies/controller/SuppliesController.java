package com.kh.spring.supplies.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

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
	public String insertSupplies(Supplies supplies, HttpServletRequest req)
   {
		
		suppliesService.insertSupplies(supplies);
			
		//System.out.println("스트링 값 컨드롤러? " +supplies );
		
		return "supplies/updateSupplies";
		
	}
	
	
	//업데이트 폼으로 넘기는 supplies list
	@RequestMapping("updateSupForm.su")
	public ModelAndView updateForm(int empId, ModelAndView mv) {
		
		ArrayList<Return> returnList = suppliesService.updateForm(empId);
		
		//System.out.println(" ???? " + returnList);
		
		mv.addObject("returnList", returnList).setViewName("supplies/updateSupplies");
		
		
		return mv;
	}
	
	@RequestMapping("updateDate.su")
	public ModelAndView updateDate(Return re, ModelAndView mv, HttpServletRequest request, Model model ) {
		
		Return reInfo = suppliesService.updateDate(re);
		model.addAttribute("reInfo", reInfo);
		
		System.out.println("머가 스트링? " + reInfo);
		
		mv.addObject("empId", re.getEmpId()).setViewName("redirect:updateSupForm.su");
		
		
		return mv;
	}

}
