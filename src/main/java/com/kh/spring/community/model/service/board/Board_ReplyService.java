package com.kh.spring.community.model.service.board;

import java.util.ArrayList;

import com.kh.spring.community.model.vo.Board_Reply;

public interface Board_ReplyService {

	int insertReply(Board_Reply br);

	ArrayList<Board_Reply> selectReplyList(int bno);

	int updateReply(Board_Reply br);

	int deleteReply(Board_Reply br);

	
}
