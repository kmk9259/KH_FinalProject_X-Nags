package com.kh.spring.community.model.service.voting;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.community.model.dao.voting.VotingDao;
import com.kh.spring.community.model.vo.PageInfo;
import com.kh.spring.community.model.vo.Voting;
import com.kh.spring.community.model.vo.VotingA;

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

		int result = votingDao.insertVoting(sqlSession, v);

		if (result > 0) {

			String[] vContent = v.getVotingContent().split(",");
			for (int i = 0; i < vContent.length; i++) {
				String content = v.getVotingContent();
				content = vContent[i];
				votingDao.insertContent(sqlSession, content);
			}

		}
	}

	@Override
	public Voting selectVoting(int bno) {
		Voting v = null;
		v = votingDao.selectVoting(sqlSession, bno);

		return v;
	}

}
