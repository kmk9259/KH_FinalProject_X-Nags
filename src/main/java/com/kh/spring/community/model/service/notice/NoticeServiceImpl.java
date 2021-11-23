package com.kh.spring.community.model.service.notice;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.common.exception.CommException;
import com.kh.spring.community.model.dao.notice.NoticeDao;
import com.kh.spring.community.model.vo.Board;
import com.kh.spring.community.model.vo.Notice;
import com.kh.spring.community.model.vo.PageInfo;

@Service
public class NoticeServiceImpl implements NoticeService {
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Autowired
	private NoticeDao noticeDao;

	@Override
	public int selectListCount() {

		return noticeDao.selectListCount(sqlSession);
	}

	@Override
	public ArrayList<Notice> selectList(PageInfo pi) {
		return noticeDao.selectList(sqlSession, pi);
	}

	@Override
	public Notice selectNotice(int bno) {
		Notice n = null;
		int result = noticeDao.increaseCount(sqlSession, bno);
		if (result < 0) {
			throw new CommException("게시글 조회수 증가 실패");
		} else {
			n = noticeDao.selectNotice(sqlSession, bno);
		}
		return n;
	}

	@Override
	public void insertNotice(Notice n) {
		int result = noticeDao.insertNotice(sqlSession, n);
		if (result < 0) {
			throw new CommException("게시글 등록 실패");
		}
	}

	@Override
	public void updateNotice(Notice n) {
		int result = noticeDao.updateNotice(sqlSession, n);
		if (result < 0) {
			throw new CommException("updateNotice 실패");
		}
	}

	@Override
	public void deleteNotice(int bno) {
		int result = noticeDao.deleteNotice(sqlSession, bno);
		if (result < 0) {
			throw new CommException("공지사항 삭제 실패");
		}
	}

	@Override
	public ArrayList<Notice> selectTopList() {
		return noticeDao.selectTopList(sqlSession);
	}
}
