package com.kh.spring.community.model.dao.board;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.community.model.vo.Board_Reply;

@Repository
public class Board_ReplyDao {

	public int insertReply(SqlSessionTemplate sqlSession, Board_Reply br) {	
		return sqlSession.insert("boardReplyMapper.insertReply",br);
	}

	public ArrayList<Board_Reply> selectReplyList(SqlSessionTemplate sqlSession, int bno) {	
		return (ArrayList)sqlSession.selectList("boardReplyMapper.selectReplyList",bno);
	}

	public int updateReply(SqlSessionTemplate sqlSession, Board_Reply br) {
		return sqlSession.update("boardReplyMapper.updateReply",br);
	}

	public int deleteReply(SqlSessionTemplate sqlSession, Board_Reply br) {
		return sqlSession.delete("boardReplyMapper.deleteReply",br);
	}

}
