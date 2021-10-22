package com.kh.spring.board.model.service;

import java.util.ArrayList;

import com.kh.spring.board.model.vo.Board;
import com.kh.spring.board.model.vo.PageInfo;
import com.kh.spring.board.model.vo.Reply;

public interface BoardService {

	int selectListCount();

	ArrayList<Board> selectList(PageInfo pi);

	void insertBoard(Board b);

	Board selectBoard(int bno);

	void deleteBoard(int bno);

	void updateBoard(Board b);

	ArrayList<Reply> selectReplyList(int bno);

	int insertReply(Reply r);

	ArrayList<Board> selectTopList();

	

}
