package com.kh.spring.community.model.dao.notice;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.community.model.vo.Notice;
import com.kh.spring.community.model.vo.PageInfo;

@Repository
public class NoticeDao {

	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("noticeMapper.selectListCount");
	}

	public ArrayList<Notice> selectList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList) sqlSession.selectList("noticeMapper.selectList", null, rowBounds);
	}

	public int increaseCount(SqlSessionTemplate sqlSession, int bno) {
		return sqlSession.update("noticeMapper.increaseCount", bno);
	}

	public Notice selectNotice(SqlSessionTemplate sqlSession, int bno) {
		return sqlSession.selectOne("noticeMapper.selectNotice", bno);
	}

	public int insertNotice(SqlSessionTemplate sqlSession, Notice n) {
		return sqlSession.insert("noticeMapper.insertNotice", n);
	}

	public int updateNotice(SqlSessionTemplate sqlSession, Notice n) {
		return sqlSession.update("noticeMapper.updateNotice", n);
	}

	public int deleteNotice(SqlSessionTemplate sqlSession, int bno) {
		return sqlSession.delete("noticeMapper.deleteNotice", bno);
	}

	public ArrayList<Notice> noticeWriter(SqlSessionTemplate sqlSession, Notice writer) {
		return (ArrayList)sqlSession.selectList("noticeMapper.noticeWriter",writer);
	}

	public ArrayList<Notice> selectTopList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("noticeMapper.selectTopList");
	}
}
