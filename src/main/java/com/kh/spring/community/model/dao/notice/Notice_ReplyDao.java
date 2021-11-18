package com.kh.spring.community.model.dao.notice;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.community.model.vo.Notice_Reply;

@Repository
public class Notice_ReplyDao {

	public int insertNoticeReply(SqlSessionTemplate sqlSession, Notice_Reply nr) {
		return sqlSession.insert("noticeReplyMapper.insertNoticeReply",nr);
	}

	public ArrayList<Notice_Reply> selectNoticeReplyList(SqlSessionTemplate sqlSession, int bno) {
		return (ArrayList)sqlSession.selectList("noticeReplyMapper.selectNoticeReplyList",bno);
	}

	public int updateNoticeReply(SqlSessionTemplate sqlSession, Notice_Reply nr) {
		return sqlSession.update("noticeReplyMapper.updateNoticeReply",nr);
	}

	public int deleteNoticeReply(SqlSessionTemplate sqlSession, Notice_Reply nr) {
		return sqlSession.delete("noticeReplyMapper.deleteNoticeReply",nr);
	}
}
