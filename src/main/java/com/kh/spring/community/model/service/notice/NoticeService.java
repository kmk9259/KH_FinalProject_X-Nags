package com.kh.spring.community.model.service.notice;

import java.util.ArrayList;

import com.kh.spring.community.model.vo.Board;
import com.kh.spring.community.model.vo.Notice;
import com.kh.spring.community.model.vo.PageInfo;

public interface NoticeService{

	int selectListCount();

	ArrayList<Notice> selectList(PageInfo pi);

	Notice selectNotice(int bno);

	void insertNotice(Notice n);

	void updateNotice(Notice n);

	void deleteNotice(int bno);

	ArrayList<Notice> selectTopList();



	

	
}
