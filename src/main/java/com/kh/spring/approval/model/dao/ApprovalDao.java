package com.kh.spring.approval.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.jdbc.SQL;
import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.approval.model.vo.Approval;
import com.kh.spring.approval.model.vo.Outwork;
import com.kh.spring.employee.model.vo.Employee;
import com.kh.spring.holiday.model.vo.Holiday;
import com.kh.spring.approval.model.vo.PageInfo;

@Repository
public class ApprovalDao {
	  
	//결재 작성
	public int insertApproval(SqlSessionTemplate sqlSession, Approval app) {
		
		return sqlSession.insert("approvalMapper.insertApproval", app);
	}
	
	//진행중 결재함 카운트
	public int selectApprovalListCount(SqlSessionTemplate sqlSession, String empId) {
		
		return sqlSession.selectOne("approvalMapper.selectApprovalListCount", empId);
	}

	//진행중 결재함 리스트 보기
	public ArrayList<Approval> selectApprovalList(SqlSessionTemplate sqlSession, PageInfo pi, String empId) {
		
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit()); 
		
		
		return (ArrayList)sqlSession.selectList("approvalMapper.selectApprovalList", empId, rowBounds);
	}
	
	//진행중 결재 보기
	public Approval selectApprovalDetail(SqlSessionTemplate sqlSession, int ano) {
		
		return sqlSession.selectOne("approvalMapper.selectApprovalDetail", ano);
	}
	
	//결재 요청함 수
	public int selectAskApprovalListCount(SqlSessionTemplate sqlSession, String empId) {
		
		return sqlSession.selectOne("approvalMapper.selectAskApprovalListCount", empId);
	}
	
	//결재 요청함 리스트
	public ArrayList<Approval> selectAskApprovalList(SqlSessionTemplate sqlSession, PageInfo pi, String empId) {

		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit()); 
		
		return (ArrayList)sqlSession.selectList("approvalMapper.selectAskApprovalList", empId, rowBounds);
	}

	//결재 요청함 보기
	public Approval selectAskApprovalDetail(SqlSessionTemplate sqlSession, int ano) {
		
		return sqlSession.selectOne("approvalMapper.selectAskApprovalDetail", ano);
	}
	
	//기안자정보
	public Employee selectAppWriter(SqlSessionTemplate sqlSession, String empId) {
		
		return sqlSession.selectOne("approvalMapper.selectAppWriter", empId);
	}
	
	//중간결재자 정보
	public Employee selectAppMid(SqlSessionTemplate sqlSession, String appMid) {
		
		return sqlSession.selectOne("approvalMapper.selectAppMid", appMid);
	}
	
	//최종결재자 정보
	public Employee selectAppFin(SqlSessionTemplate sqlSession, String appFin) {
		
		return sqlSession.selectOne("approvalMapper.selectAppFin", appFin);
	}

	//중간결재 승인
	public int midConfirm(SqlSessionTemplate sqlSession, Approval app) {
		
		return sqlSession.update("approvalMapper.midConfirm", app);
	}
	
	//중간결재반려
	public int midReject(SqlSessionTemplate sqlSession, Approval app) {
		return sqlSession.update("approvalMapper.midReject", app);
	}

	//휴가추가
	public int insertHoliday(SqlSessionTemplate sqlSession, Holiday hol) {
		
		return sqlSession.insert("approvalMapper.insertHoliDay", hol);
	}
	
	//최종승인
	public int finConfirm(SqlSessionTemplate sqlSession, Approval app) {

		return sqlSession.update("approvalMapper.finConfirm", app);
	}
	
	//최종반려
	public int finReject(SqlSessionTemplate sqlSession, Approval app) {

		return sqlSession.update("approvalMapper.finReject", app);
	}
	
	//연차감소
	public int decreaseCount(SqlSessionTemplate sqlSession, Holiday hol) {
		
		return sqlSession.update("approvalMapper.decreaseCount", hol);
	}
	
	//진행중 결재 수정
	public int updateApproval(SqlSessionTemplate sqlSession, Approval app) {
		
		return sqlSession.update("approvalMapper.updateApproval", app);
	}
	
	//진행중 결재함 삭제
	public int deleteProcessingApproval(SqlSessionTemplate sqlSession, int ano) {
		
		return sqlSession.update("approvalMapper.deleteProcessingApproval", ano);
	}
	
	//완료결재함 수
	public int selectProcessedAppListCount(SqlSessionTemplate sqlSession, String empId) {

		return sqlSession.selectOne("approvalMapper.selectProcessedAppListCount", empId);
	}
	
	//완료결재함 리스트
	public ArrayList<Approval> selectProcessedAppList(SqlSessionTemplate sqlSession, PageInfo pi, String empId) {
		
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit()); 
		
		return (ArrayList)sqlSession.selectList("approvalMapper.selectProcessedAppList", empId, rowBounds);
	}
	
	//결재완료문서보기
	public Approval selectProcessedAppDetail(SqlSessionTemplate sqlSession, int ano) {
		
		return sqlSession.selectOne("approvalMapper.selectProcessedAppDetail", ano);
	}

	//휴가정보 가져오기
	public Holiday selectHoliday(SqlSessionTemplate sqlSession, int ano) {

		return sqlSession.selectOne("approvalMapper.selectHoliday", ano);
	}

	//연차 되돌리기
	public int increaseCount(SqlSessionTemplate sqlSession, Holiday hol) {

		return sqlSession.update("approvalMapper.increaseCount", hol);
	}

	//휴가정보삭제
	public int deleteHoliday(SqlSessionTemplate sqlSession, int ano) {

		return sqlSession.delete("approvalMapper.deleteHoliday", ano);
	}

	//결재문서 삭제
	public int deleteProcessedApproval(SqlSessionTemplate sqlSession, int ano) {

		return sqlSession.delete("approvalMapper.deleteProcessedApproval", ano);
	}
	
	//외근 추가
	public int insertOutwork(SqlSessionTemplate sqlSession, Outwork out) {
		
		return sqlSession.insert("approvalMapper.insertOutwork", out);
	}

	public int deleteOutwork(SqlSessionTemplate sqlSession, int ano) {
		
		return sqlSession.delete("approvalMapper.deleteOutwork", ano);
	}

	public ArrayList<Approval> mainAppingList(SqlSessionTemplate sqlSession, String empId) {
		return (ArrayList)sqlSession.selectList("approvalMapper.mainAppingList", empId);
	}

	public ArrayList<Approval> mainAppAskList(SqlSessionTemplate sqlSession, String empId) {
		return (ArrayList)sqlSession.selectList("approvalMapper.mainAppAskList", empId);
	}

	public ArrayList<Approval> mainAppedList(SqlSessionTemplate sqlSession, String empId) {
		return (ArrayList)sqlSession.selectList("approvalMapper.mainAppedList", empId);
	}

	public int selectCountNoApp(SqlSessionTemplate sqlSession, String empId) {
	
		return sqlSession.selectOne("approvalMapper.selectCountNoApp", empId);
	}
	
	

	
}
