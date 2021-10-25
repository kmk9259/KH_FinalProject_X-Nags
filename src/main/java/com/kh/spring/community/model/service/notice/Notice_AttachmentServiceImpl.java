package com.kh.spring.community.model.service.notice;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.community.model.dao.notice.Notice_AttachmentDao;
@Service
public class Notice_AttachmentServiceImpl implements Notice_AttachmentService {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private Notice_AttachmentDao notice_AttachmentDao;
	
}
