package com.kh.spring.approval.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.kh.spring.approval.model.service.ApprovalService;

@Controller
public class ApprovalController {

	@Autowired
	private ApprovalService approvalService;
}
