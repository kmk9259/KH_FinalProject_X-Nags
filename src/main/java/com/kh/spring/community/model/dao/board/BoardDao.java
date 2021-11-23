package com.kh.spring.community.model.dao.board;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.community.model.vo.Board;
import com.kh.spring.community.model.vo.Notice;
import com.kh.spring.community.model.vo.PageInfo;
@Repository
public class BoardDao {

	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("boardMapper.selectListCount");
	}

	public ArrayList<Board> selectList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() -1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("boardMapper.selectList",null,rowBounds);
	}

	public int insertBoard(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.insert("boardMapper.insertBoard",b);
	}

	public int increaseCount(SqlSessionTemplate sqlSession, int bno) {
		return sqlSession.update("boardMapper.increaseCount",bno);
	}

	public Board selectBoard(SqlSessionTemplate sqlSession, int bno) {
		return sqlSession.selectOne("boardMapper.selectBoard",bno);
	}

	public int deleteBoard(SqlSessionTemplate sqlSession, int bno) {
		return sqlSession.delete("boardMapper.deleteBoard",bno);
	}

	public int updateBoard(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.update("boardMapper.updateBoard", b);
	}

	public ArrayList<Notice> selectTopList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("boardMapper.selectTopList");
	}
	
}
