package com.kh.spring.community.controller.voting;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.spring.common.Pagination;
import com.kh.spring.community.model.service.voting.VotingService;
import com.kh.spring.community.model.vo.Board;
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

	@RequestMapping("votingInsert.bo")
	public String insertBoard(Voting v) {
		//String[] vContent = v.getVotingContent().split(",");
		/*
		 * for(int i = 0; i< v.getVotingContent().length; i++) {
		 * v.setVotingContent(v.getVotingContent()); }
		 */
		
		votingService.insertVoting(v);

		return "redirect:voting.vo";
	}

	@RequestMapping("votingdetail.bo")
	public ModelAndView selectVoting(int bno, ModelAndView mv) {
		Voting v = votingService.selectVoting(bno);
		System.out.println(v.getVotingContent() + "보팅 ");
		
		String[] vContent = v.getVotingContent().split(",");
		System.out.println(vContent[1] + "111111");
		System.out.println(vContent[0] + "00000");
		
		mv.addObject("v", v).setViewName("voting/votingDetail");
		mv.addObject("vContent",vContent).setViewName("voting/votingDetail");
		return mv;
	}
	
	
	
	/*
	 * @RequestMapping("votingAction.vo") public ModelAndView votingAction(Voting v)
	 * { votingService.votingAction(v); return mv; }
	 */
}
