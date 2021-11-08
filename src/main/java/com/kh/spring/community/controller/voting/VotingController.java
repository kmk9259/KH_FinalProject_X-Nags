package com.kh.spring.community.controller.voting;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.spring.common.Pagination;
import com.kh.spring.community.model.service.voting.VotingService;
import com.kh.spring.community.model.vo.PageInfo;
import com.kh.spring.community.model.vo.Voting;
@Controller
public class VotingController {

	@Autowired 
	private VotingService votingService;
	
	@RequestMapping("voting.vo")
	public String votingList(@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage,
			Model model) {

		int listCount = votingService.selectListCount();
		System.out.println(listCount);

		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);

		ArrayList<Voting> list = votingService.selectList(pi);

		System.out.println(list + " 리스트");
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		return "voting/votingList";
	}

	@RequestMapping("enrollVoting.vo")
	public String enrollForm() {
		return "voting/enrollVoting";
	}
}
