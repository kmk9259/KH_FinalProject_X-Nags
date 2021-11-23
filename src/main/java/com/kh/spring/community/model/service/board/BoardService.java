package com.kh.spring.community.model.service.board;

import java.util.ArrayList;

import com.kh.spring.community.model.vo.Board;
import com.kh.spring.community.model.vo.Board_Reply;
import com.kh.spring.community.model.vo.Notice;
import com.kh.spring.community.model.vo.PageInfo;

public interface BoardService {


	int selectListCount();

	ArrayList<Board> selectList(PageInfo pi);

	void insertBoard(Board b);

	Board selectBoard(int bno);

	void deleteBoard(int bno);

	void updateBoard(Board b);

	ArrayList<Notice> selectTopList();





}
