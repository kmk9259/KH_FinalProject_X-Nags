package com.kh.spring.community.controller.voting;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.spring.common.Pagination;
import com.kh.spring.community.model.service.voting.VotingService;
import com.kh.spring.community.model.vo.PageInfo;
import com.kh.spring.community.model.vo.Voting;
import com.kh.spring.community.model.vo.VotingA;

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

	@RequestMapping("votingInsert.bo")
	public String insertVoting( Voting v) {
			
			votingService.insertVoting(v);

		return "redirect:voting.vo";
	}

	@RequestMapping("votingdetail.bo")
	public ModelAndView selectVoting(int bno, ModelAndView mv) {
		Voting v = votingService.selectVoting(bno);
		ArrayList<VotingA> va = votingService.selectList2(bno);
		
		mv.addObject("v", v).setViewName("voting/votingDetail");
		mv.addObject("va",va).setViewName("voting/votingDetail");
		return mv;
	}
	
	@RequestMapping("votingAction.vo")
	public String votingUpdate(@RequestParam(value = "votingNo") int votingNo,
								@RequestParam(value = "content") String content) {

		 VotingA va = new VotingA();
		 va.setRefNo(votingNo);
		 va.setContent(content);

		votingService.votingUpdate(va);
		 
		
		return "redirect:voting.vo";
	}

	@RequestMapping("votingResult.vo")
	public ModelAndView votingResult(@RequestParam(value = "bno") int bno, ModelAndView mv) {				
		
		System.out.println(bno + "222번호");	
		Voting v = votingService.selectVoting(bno);
		ArrayList<VotingA> va = votingService.selectList2(bno);
		
		mv.addObject("v", v).setViewName("voting/resultPage");
		mv.addObject("va",va).setViewName("voting/resultPage");
	
		return mv;
	}
	
	
}
