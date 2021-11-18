package com.kh.spring.community.model.service.board;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.common.exception.CommException;
import com.kh.spring.community.model.dao.board.Board_ReplyDao;
import com.kh.spring.community.model.vo.Board_Reply;

@Service
public class Board_ReplyServiceImpl implements Board_ReplyService {

	@Autowired
	private Board_ReplyDao board_ReplyDao;
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int insertReply(Board_Reply br) {
		int result = board_ReplyDao.insertReply(sqlSession, br);
		if (result < 0) {
			throw new CommException("insertReply 실패");
		}
		return result;
	}

	@Override
	public ArrayList<Board_Reply> selectReplyList(int bno) {
		return board_ReplyDao.selectReplyList(sqlSession, bno); 
	}

	@Override
	public int updateReply(Board_Reply br) {
		int result = board_ReplyDao.updateReply(sqlSession, br);
		return result;
	}

	@Override
	public int deleteReply(Board_Reply br) {
		int result = board_ReplyDao.deleteReply(sqlSession, br);
		if (result < 0) {
			throw new CommException("댓글 삭제 실패");
		}
		return result;
	}
}
