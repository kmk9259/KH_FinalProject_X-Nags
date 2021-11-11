package com.kh.spring.community.model.service.voting;

import java.util.ArrayList;

import com.kh.spring.community.model.vo.PageInfo;
import com.kh.spring.community.model.vo.Voting;
import com.kh.spring.community.model.vo.VotingA;

public interface VotingService {

	int selectListCount();

	ArrayList<Voting> selectList(PageInfo pi);

	void insertVoting(Voting v);

	Voting selectVoting(int bno);

	



	
}
