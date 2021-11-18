package com.kh.spring.community.model.service.voting;

import java.util.ArrayList;

import com.kh.spring.community.model.vo.PageInfo;
import com.kh.spring.community.model.vo.Voting;
import com.kh.spring.community.model.vo.VotingA;
import com.kh.spring.community.model.vo.VotingG;

public interface VotingService {

	int selectListCount();

	ArrayList<Voting> selectList(PageInfo pi);

	void insertVoting(Voting v);

	Voting selectVoting(int bno);

	ArrayList<VotingA> selectList2(int bno);

	void votingUpdate(VotingA va);

	ArrayList<VotingG> selectVotingGrant(int bno);

	void votingGrant(VotingG vg);

	ArrayList<VotingG> selectVotingGrant2();

	void deleteVoting1(int bno);

	void deleteVoting2(int bno);

	void deleteVoting3(int bno);







	

	



	
}
