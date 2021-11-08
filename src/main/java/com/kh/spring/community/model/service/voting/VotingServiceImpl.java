package com.kh.spring.community.model.service.voting;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.community.model.dao.voting.VotingDao;
import com.kh.spring.community.model.vo.PageInfo;
import com.kh.spring.community.model.vo.Voting;
@Service
public class VotingServiceImpl implements VotingService {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private VotingDao votingDao;

	@Override
	public int selectListCount() {
		return votingDao.selectListCount(sqlSession);
	}

	@Override
	public ArrayList<Voting> selectList(PageInfo pi) {
		return votingDao.selectVotingList(sqlSession, pi);
	}
	
}
