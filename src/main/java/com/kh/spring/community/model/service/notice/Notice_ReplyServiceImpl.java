package com.kh.spring.community.model.service.notice;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.community.model.dao.notice.Notice_ReplyDao;
@Service
public class Notice_ReplyServiceImpl implements Notice_ReplyService {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	@Autowired
	private Notice_ReplyDao notice_ReplyDao;
}
