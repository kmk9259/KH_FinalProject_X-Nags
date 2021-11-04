package com.kh.spring.community.model.service.notice;

import java.util.ArrayList;

import com.kh.spring.community.model.vo.Notice_Reply;

public interface Notice_ReplyService {

	int insertNoticeReply(Notice_Reply nr);

	ArrayList<Notice_Reply> selectNoticeReplyList(int bno);

	int updateNoticeReply(Notice_Reply nr);

	int deleteNoticeReply(Notice_Reply nr);

	
}
