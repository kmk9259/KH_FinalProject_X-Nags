package com.kh.spring.community.model.service.voting;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.common.exception.CommException;
import com.kh.spring.community.model.dao.voting.VotingDao;
import com.kh.spring.community.model.vo.Board;
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

	@Override
	public void insertVoting(Voting v) {
		int result = votingDao.insertVoting(sqlSession,v);

		if (result < 0) {
			throw new CommException("게시글 등록 실패");
		}
	}

	@Override
	public Voting selectVoting(int bno) {
		Voting v = null;	
			v = votingDao.selectVoting(sqlSession, bno);
		

		return v;
	}
}
	

