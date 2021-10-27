package com.kh.spring.community.model.service.board;

import java.util.ArrayList;

import com.kh.spring.community.model.vo.Board;
import com.kh.spring.community.model.vo.Board_Attachment;
import com.kh.spring.community.model.vo.PageInfo;

public interface BoardService {


	int selectListCount();

	ArrayList<Board> selectList(PageInfo pi);

	void insertBoard(Board b);

	Board selectBoard(int bno);

	void deleteBoard(int bno);

	void updateBoard(Board_Attachment ba);
/*
	ArrayList<Reply> selectReplyList(int bno);

	int insertReply(Reply r);
*/


}
