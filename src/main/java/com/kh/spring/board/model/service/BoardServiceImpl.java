package com.kh.spring.board.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.board.model.dao.BoardDao;
import com.kh.spring.board.model.vo.Board;
import com.kh.spring.board.model.vo.PageInfo;
import com.kh.spring.board.model.vo.Reply;
import com.kh.spring.common.exception.CommException;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private BoardDao boardDao;
	
	@Override
	public int selectListCount() {
		return boardDao.selectListCount(sqlSession);
	}

	@Override
	public ArrayList<Board> selectList(PageInfo pi) {
		return boardDao.selectList(sqlSession, pi);
	}

	@Override
	public void insertBoard(Board b) {
		int result= boardDao.insertBoard(sqlSession, b);
		
		if(result <0) {
			throw new CommException("게시글 등록 실패");
		}		
	}

	@Override
	public Board selectBoard(int bno) {
		Board b = null;
		int result = boardDao.increaseCount(sqlSession, bno);
		
		if(result < 0) {
			throw new CommException("게시글 조회수 증가 실패");
		}else {
			b= boardDao.selectBoard(sqlSession, bno);
		}
		return b;
	}

	@Override
	public void deleteBoard(int bno) {
		int result = boardDao.deleteBoard(sqlSession, bno);
		if(result < 0) {
			throw new CommException("게시글 삭제 실패");
		}
	}

	@Override
	public void updateBoard(Board b) {
		int result = boardDao.updateBoard(sqlSession, b);
		if(result < 0) {
			throw new CommException("게시글 수정 실패");
		}		
	}

	@Override
	public ArrayList<Reply> selectReplyList(int bno) {
		return boardDao.selectReplyList(sqlSession, bno);
	}

	@Override
	public int insertReply(Reply r) {
		int result = boardDao.insertReply(sqlSession, r);
		if(result < 0) {
			throw new CommException("댓글 작성 실패");
		}	
		return result;
	}

	@Override
	public ArrayList<Board> selectTopList() {
		return boardDao.selectTopList(sqlSession);
	}

}
