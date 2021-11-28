package com.kh.spring.mail.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.employee.model.vo.Employee;
import com.kh.spring.mail.model.vo.Mail;
import com.kh.spring.mail.model.vo.PageInfo;
import com.kh.spring.member.model.vo.Member;

@Repository
public class MailDao {

	//메일 작성
	public int insertMail(SqlSessionTemplate sqlSession, Mail m) {
		
		return sqlSession.insert("mailMapper.insertMail", m);
	}
	
	//보낸 메일함 리스트 수
	public int selectSendMailListCount(SqlSessionTemplate sqlSession, String empId) {
		
		return sqlSession.selectOne("mailMapper.selectSendMailListCount", empId);
	}
	
	//보낸 메일함 리스트
	public ArrayList<Mail> selectSendMailList(SqlSessionTemplate sqlSession, PageInfo pi, String empId) {
		
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit()); 
		
		return (ArrayList)sqlSession.selectList("mailMapper.selectSendMailList", empId, rowBounds);
	}

	//보낸메일 보기
	public Mail selectSendMail(SqlSessionTemplate sqlSession, int mno) {
		return sqlSession.selectOne("mailMapper.selectSendMail", mno);
	}

	//받은 메일함 리스트 수
	public int selectReceiveMailListCount(SqlSessionTemplate sqlSession, String empId) {
		
		return sqlSession.selectOne("mailMapper.selectReceiveMailListCount", empId);
	}

	//받은 메일 리스트
	public ArrayList<Mail> selectReceiveMailList(SqlSessionTemplate sqlSession, PageInfo pi, String empId) {
		
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit()); 
		
		return (ArrayList)sqlSession.selectList("mailMapper.selectReceiveMailList", empId, rowBounds);
	}

	//받은메일보기
	public Mail selectReceiveMail(SqlSessionTemplate sqlSession, int mno) {
		
		return sqlSession.selectOne("mailMapper.selectReceiveMail", mno);
	}

	//받은메일 확인 시 조회수 증가
	public int increaseCount(SqlSessionTemplate sqlSession, int mno) {
		
		return sqlSession.update("mailMapper.increaseCount", mno);
	}
	
	//받은메일 휴지통
	public int wasteReceiveMail(SqlSessionTemplate sqlSession, int mno) {
		
		return sqlSession.update("mailMapper.wasteReceiveMail", mno);
	}
	
	//보낸메일 다시 보내기
	public int resendMail(SqlSessionTemplate sqlSession, Mail m) {
		
		return sqlSession.insert("mailMapper.resendMail", m);
	}
	
	//유저이름으로 유저아이디 가져오기
	public Member getReceiver(SqlSessionTemplate sqlSession, String receiver) {
		
		return sqlSession.selectOne("mailMapper.getReceiver", receiver);
	}

	//보낸메일 전달
	public int insertSendDelivery(SqlSessionTemplate sqlSession, Mail m) {
		
		return sqlSession.insert("mailMapper.insertSendDelivery", m);
	}
	
	//보낸메일 뷰에서 휴지통으로
	public int wasteSendMail(SqlSessionTemplate sqlSession, int mno) {
		
		return sqlSession.update("mailMapper.wasteSendMail", mno);
	}
	
	//휴지통수
	public int selectWasteMailListCount(SqlSessionTemplate sqlSession, String empId) {
		
		return sqlSession.selectOne("mailMapper.selectWasteMailListCount", empId);
	}

	//휴지통 리스트
	public ArrayList<Mail> selectWasteMailList(SqlSessionTemplate sqlSession, PageInfo pi, String empId) {
		
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit()); 
		
		return (ArrayList)sqlSession.selectList("mailMapper.selectWasteMailList", empId, rowBounds);
	}

	//받은메일 답장
	public int insertReply(SqlSessionTemplate sqlSession, Mail m) {
		
		return sqlSession.insert("mailMapper.insertReply", m);
	}
	
	//보낸메일 복구
	public int returnSendMail(SqlSessionTemplate sqlSession, int mno) {
	
		return sqlSession.update("mailMapper.returnSendMail", mno);
	}
	
	//받은메일 복구
	public int returnReceiveMail(SqlSessionTemplate sqlSession, int mno) {
	
		return sqlSession.update("mailMapper.returnReceiveMail", mno);
	}

	//메일 영구삭제
	public int wasteMail(SqlSessionTemplate sqlSession, int mno) {
	
		return sqlSession.delete("mailMapper.wasteMail", mno);
	}
	
	//발신자상태3
	public int updateWriter(SqlSessionTemplate sqlSession, int mno) {
	
		return sqlSession.update("mailMapper.updateWriter", mno);
	}

	//수신자상태3
	public int updateReceiver(SqlSessionTemplate sqlSession, int mno) {
	 
		return sqlSession.update("mailMapper.updateReceiver", mno);
	}

	//주소록
	public ArrayList<Employee> selectEmployeeList(SqlSessionTemplate sqlSession, String deptCode) {
		
		return (ArrayList)sqlSession.selectList("mailMapper.selectEmployeeList", deptCode);
	}

	//보낸사람
	public Member selectSendEmp(SqlSessionTemplate sqlSession, int mno) {
	
		return sqlSession.selectOne("mailMapper.selectSendEmp", mno);
	}
	
	//메일번호로 메일 선택
	public Mail selectMail(SqlSessionTemplate sqlSession, int mno) {
		
		return sqlSession.selectOne("mailMapper.selectMail", mno);
	}

	//받는사람
	public Member selectReceiveEmp(SqlSessionTemplate sqlSession, int mno) {
	
		return sqlSession.selectOne("mailMapper.selectReceiveEmp", mno);
	}

	//메인 보낸메일
	public ArrayList<Mail> mainSendMailList(SqlSessionTemplate sqlSession, String empId) {
		
		return (ArrayList)sqlSession.selectList("mailMapper.mainSendMailList", empId);
	}

	//메인 받은 메일
	public ArrayList<Mail> mainReceiveMailList(SqlSessionTemplate sqlSession, String empId) {
		return (ArrayList)sqlSession.selectList("mailMapper.mainReceiveMailList", empId);
	}

	//안읽은 메일 갯수
	public int selectCountNoRead(SqlSessionTemplate sqlSession, String empId) {

		return sqlSession.selectOne("mailMapper.selectCountNoRead", empId);
	}

}
