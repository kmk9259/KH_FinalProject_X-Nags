package com.kh.spring.supplies.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.spring.supplies.model.service.SuppliesService;
import com.kh.spring.supplies.model.vo.Sitems;
import com.kh.spring.supplies.model.vo.Supplies;

@Controller
public class SuppliesController {

	@Autowired
	private SuppliesService suppliesService;
	
	@RequestMapping("supplies.me")
	public String rentalSup(Model model) {
		
		ArrayList<Sitems> supList = suppliesService.selectSitems();
		
		model.addAttribute("supList", supList);
		
		return "supplies/supplies";
	}
	
	@RequestMapping("return.me")
	public String returnSup() {
		return "supplies/return";
	}
}
