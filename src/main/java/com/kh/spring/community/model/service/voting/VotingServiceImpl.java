package com.kh.spring.community.model.service.voting;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.common.exception.CommException;
import com.kh.spring.community.model.dao.voting.VotingDao;
import com.kh.spring.community.model.vo.Notice;
import com.kh.spring.community.model.vo.PageInfo;
import com.kh.spring.community.model.vo.Voting;
import com.kh.spring.community.model.vo.VotingA;
import com.kh.spring.community.model.vo.VotingG;

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
		int result = votingDao.increaseCount(sqlSession, bno);
		if (result < 0) {
			throw new CommException("게시글 조회수 증가 실패");
		} else {
			v = votingDao.selectVoting(sqlSession, bno);
		}			
		return v;
	}

	@Override
	public ArrayList<VotingA> selectList2(int bno) {			
		return votingDao.selectVotingList2(sqlSession,bno);		
	}

	@Override
	public void votingUpdate(VotingA va) {
		int result = votingDao.votingUpdate(sqlSession, va);			
	}

	@Override
	public ArrayList<VotingG> selectVotingGrant(int bno) {
		return votingDao.selectVotingGrant(sqlSession, bno);		
	}

	@Override
	public void votingGrant(VotingG vg) {
		int result = votingDao.votingGrant(sqlSession, vg);		
	}

	@Override
	public ArrayList<VotingG> selectVotingGrant2() {
		return votingDao.selectVotingGrant2(sqlSession);
	}

	@Override
	public void deleteVoting1(int bno) {
		int result = votingDao.deleteVoting1(sqlSession, bno);
		if (result < 0) {
			throw new CommException("게시글 삭제 실패");
		}			
	}

	@Override
	public void deleteVoting2(int bno) {
		int result = votingDao.deleteVoting2(sqlSession, bno);
		if (result < 0) {
			throw new CommException("게시글 삭제 실패");
		}		
	}

	@Override
	public void deleteVoting3(int bno) {
		int result = votingDao.deleteVoting3(sqlSession, bno);
		if (result < 0) {
			throw new CommException("게시글 삭제 실패");
		}
	}	
}
