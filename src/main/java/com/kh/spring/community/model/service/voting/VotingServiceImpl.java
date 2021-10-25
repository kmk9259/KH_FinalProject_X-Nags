package com.kh.spring.community.model.service.voting;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.community.model.dao.voting.VotingDao;
@Service
public class VotingServiceImpl implements VotingService {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private VotingDao votingDao;
	
}
