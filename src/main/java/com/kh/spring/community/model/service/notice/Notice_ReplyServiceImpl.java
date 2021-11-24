package com.kh.spring.community.model.service.notice;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.common.exception.CommException;
import com.kh.spring.community.model.dao.notice.Notice_ReplyDao;
import com.kh.spring.community.model.vo.Notice_Reply;
@Service
public class Notice_ReplyServiceImpl implements Notice_ReplyService {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	@Autowired
	private Notice_ReplyDao notice_ReplyDao;


	@Override
	public int insertNoticeReply(Notice_Reply nr) {
		int result = notice_ReplyDao.insertNoticeReply(sqlSession, nr);
		if (result < 0) {
			throw new CommException("insertNoticeReply 실패");
		}
		return result;
	}

	@Override
	public ArrayList<Notice_Reply> selectNoticeReplyList(int bno) {
		return notice_ReplyDao.selectNoticeReplyList(sqlSession, bno);
	}

	@Override
	public int updateNoticeReply(Notice_Reply nr) {
		int result = notice_ReplyDao.updateNoticeReply(sqlSession, nr);
		return result;
	}

	@Override
	public int deleteNoticeReply(Notice_Reply nr) {
		int result = notice_ReplyDao.deleteNoticeReply(sqlSession, nr);
		if (result < 0) {
			throw new CommException("댓글 삭제 실패");
		}
		return result;	
	}
}
