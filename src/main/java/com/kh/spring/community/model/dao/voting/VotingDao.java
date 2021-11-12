package com.kh.spring.community.model.dao.voting;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.community.model.vo.PageInfo;
import com.kh.spring.community.model.vo.Voting;
import com.kh.spring.community.model.vo.VotingA;

@Repository
public class VotingDao {

	public ArrayList<Voting> selectVotingList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() -1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("votingMapper.selectList",null,rowBounds);
	}

	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("votingMapper.selectListCount");
	}

	public int insertVoting(SqlSessionTemplate sqlSession, Voting v) {
		return sqlSession.insert("votingMapper.insertVoting",v);
	}

	public Voting selectVoting(SqlSessionTemplate sqlSession, int bno) {
		return sqlSession.selectOne("votingMapper.selectVoting",bno);
	}

	public int insertContent(SqlSessionTemplate sqlSession, String content) {
		return sqlSession.insert("votingMapper.insertContent",content);
		
	}

	public ArrayList<VotingA> selectVotingList2(SqlSessionTemplate sqlSession, int bno) {
		return (ArrayList)sqlSession.selectList("votingMapper.selectList2",bno);
	}
	public int votingUpdate(SqlSessionTemplate sqlSession, VotingA va) {
	
		return sqlSession.update("votingMapper.updateVoting",va);
	}

	public Voting selectVoting3(SqlSessionTemplate sqlSession, String bno) {
		return sqlSession.selectOne("votingMapper.selectVoting3",bno);
	}

	public ArrayList<VotingA> selectList4(SqlSessionTemplate sqlSession, String bno) {
		return (ArrayList)sqlSession.selectList("votingMapper.selectList4",bno);
	}

	
}
