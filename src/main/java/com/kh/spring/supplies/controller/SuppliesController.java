package com.kh.spring.supplies.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.spring.supplies.model.service.SuppliesService;

@Controller
public class SuppliesController {

//	@Autowired
//	private SuppliesService suppliesService;
	
	@RequestMapping("supplies.me")
	public String rentalSup() {
		return "supplies/supplies";
	}
}
