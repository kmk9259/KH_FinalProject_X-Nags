package com.kh.spring.community.model.service.voting;

import java.util.ArrayList;

import com.kh.spring.community.model.vo.PageInfo;
import com.kh.spring.community.model.vo.Voting;

public interface VotingService {

	int selectListCount();

	ArrayList<Voting> selectList(PageInfo pi);

	void insertVoting(Voting v);

	Voting selectVoting(int bno);

	
}
