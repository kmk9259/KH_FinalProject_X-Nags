package com.kh.spring.community.controller.voting;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

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
import com.kh.spring.community.model.vo.VotingG;
import com.kh.spring.member.model.vo.Member;

@Controller
public class VotingController {

	@Autowired
	private VotingService votingService;

	@RequestMapping("voting.vo")
	public String votingList(@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage,
			Model model, HttpServletRequest request) {
		Member m = (Member) request.getSession().getAttribute("loginUser");  
		int listCount = votingService.selectListCount();
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		ArrayList<Voting> list = votingService.selectList(pi);				
		for(int i = 0; i < list.size(); i++) {	
			ArrayList<VotingG> vg = votingService.selectVotingGrant(list.get(i).getVotingNo());			
			list.get(i).setResult(0);
			for(int j = 0; j < vg.size(); j++) {			
				if(m.getEmpId().equals(vg.get(j).getEmpId()) && vg.get(j).getVotingGrant() == 1) {
					list.get(i).setResult(1);
				}
			}
		}		
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
	public ModelAndView selectVoting(int bno, ModelAndView mv, HttpServletRequest request) {
		Member m = (Member) request.getSession().getAttribute("loginUser");      
		Voting v = votingService.selectVoting(bno);
		ArrayList<VotingA> va = votingService.selectList2(bno);
		ArrayList<VotingG> vg = votingService.selectVotingGrant(bno);
		int result = 0;
		for(int i = 0; i < vg.size(); i++) {			
			if(m.getEmpId().equals(vg.get(i).getEmpId()) && vg.get(i).getVotingGrant() == 1) {
				result = 1;				
			}	
		}
		mv.addObject("v", v);
		mv.addObject("va",va);
		mv.addObject("vg",vg);
		mv.addObject("result",result);
		mv.setViewName("voting/votingDetail");
		return mv;
	}
	
	@RequestMapping("votingAction.vo")
	public String votingUpdate(@RequestParam(value = "votingNo") int votingNo,
								@RequestParam(value = "content") String content,
								@RequestParam(value = "empId") String empId) {
		 VotingA va = new VotingA();
		 va.setRefNo(votingNo);
		 va.setContent(content);
		votingService.votingUpdate(va);
		 VotingG vg = new VotingG();
		 vg.setGRefNo(votingNo);
		 vg.setEmpId(empId);
		 votingService.votingGrant(vg);		 
		return "redirect:voting.vo";
	}

	@RequestMapping("votingResult.vo")
	public ModelAndView votingResult(@RequestParam(value = "bno") int bno, ModelAndView mv) {				
		Voting v = votingService.selectVoting(bno);
		ArrayList<VotingA> va = votingService.selectList2(bno);		
		mv.addObject("v", v).setViewName("voting/resultPage");
		mv.addObject("va",va).setViewName("voting/resultPage");	
		return mv;
	}
	
	@RequestMapping("deleteVoting.vo")
	public String deleteBoard(int bno) {
		votingService.deleteVoting1(bno);
		votingService.deleteVoting2(bno);
		votingService.deleteVoting3(bno);
		return "redirect:voting.vo";
	}	
}
