package com.kh.spring.community.model.service.board;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.community.model.dao.board.Board_AttachmentDao;

@Service
public class Board_AttachmentServiceImpl implements Board_AttachmentService {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private Board_AttachmentDao board_AttachmentDao;
	
}
