package com.kh.spring.approval.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.approval.model.dao.ApprovalDao;
import com.kh.spring.approval.model.vo.Approval;
import com.kh.spring.approval.model.vo.Outwork;
import com.kh.spring.common.exception.CommException;
import com.kh.spring.employee.model.vo.Employee;
import com.kh.spring.holiday.model.vo.Holiday;
import com.kh.spring.approval.model.vo.PageInfo;

@Service
public class ApprovalServiceImpl implements ApprovalService {
	 
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ApprovalDao approvalDao;
	
	//결재신청
	@Override
	public void insertApproval(Approval app) {

		int result = approvalDao.insertApproval(sqlSession, app);
		
		if(result < 0) {
			throw new CommException("결재 전송 실패");
		}
		
	}

	//진행중 결제함 카운트
	@Override
	public int selectApprovalListCount(String empId) {
		return approvalDao.selectApprovalListCount(sqlSession, empId);
	}

	//진행중 결재함 리스트
	@Override
	public ArrayList<Approval> selectApprovalList(PageInfo pi, String empId) {
		
		return approvalDao.selectApprovalList(sqlSession, pi, empId);
	}
	
	//진행중 결재 보기
	@Override
	public Approval selectApprovalDetail(int ano) {

		return approvalDao.selectApprovalDetail(sqlSession, ano);
	}
	
	//결재 요청함 리스트 수
	@Override
	public int selectAskApprovalListCount(String empId) {
		
		return approvalDao.selectAskApprovalListCount(sqlSession, empId);
	}
	
	//결재 요청함 리스트
	@Override
	public ArrayList<Approval> selectAskApprovalList(PageInfo pi, String empId) {
		
		return approvalDao.selectAskApprovalList(sqlSession, pi, empId);
	}
	
	//요청 문서 보기
	@Override
	public Approval selectAskApprovalDetail(int ano) {

		return approvalDao.selectAskApprovalDetail(sqlSession, ano);
	}
	
	//기안자정보 가져오기
	@Override
	public Employee selectAppWriter(String empId) {
		return approvalDao.selectAppWriter(sqlSession, empId);
	}
	
	//중간결재자 정보
	@Override
	public Employee selectAppMid(String appMid) {
		return approvalDao.selectAppMid(sqlSession, appMid);
	}
	
	//최종결재자 정보
	@Override
	public Employee selectAppFin(String appFin) {
		return approvalDao.selectAppFin(sqlSession, appFin);
	}


	//중간결재자 승인
	@Override
	public void midConfirm(Approval app) {
		
		int result = approvalDao.midConfirm(sqlSession, app);
		
		if(result < 0) {
			throw new CommException("중간 승인 실패");
		}
		
	}
	
	//중간결재자 반려
	@Override
	public void midReject(Approval app) {
		int result = approvalDao.midReject(sqlSession, app);
		
		if(result < 0) {
			throw new CommException("중간 반려 실패");
		}
	}
	
	//휴가추가
	@Override
	public void insertHoliday(Holiday hol) {
		
		int result = approvalDao.insertHoliday(sqlSession, hol);
		
		if(result < 0) {
			throw new CommException("휴가 추가 실패");
		}
		
	}
	
	//최종결재승인
	@Override
	public void finConfirm(Approval app) {
		
		int result = approvalDao.finConfirm(sqlSession, app);
		
		if(result < 0) {
			throw new CommException("최종 승인 실패");
		}
		
	}

	//최종결재반려
	@Override
	public void finReject(Approval app) {
		int result = approvalDao.finReject(sqlSession, app);
		
		if(result < 0) {
			throw new CommException("최종 반려 실패");
		}
		
	}
	
	//연차감소
	@Override
	public void decreaseCount(Holiday hol) {

		int result = approvalDao.decreaseCount(sqlSession, hol);
		
		if(result < 0) {
			throw new CommException("연차개수 변경 실패");
		}
		
	}
	
	//걸재 전 문서 수정
	@Override
	public void updateApproval(Approval app) {
		
		int result = approvalDao.updateApproval(sqlSession, app);
		
		if(result < 0) {
			throw new CommException("결재 수정 실패");
		}
		
	}
	
	//결재전 문서 삭제
	@Override
	public void deleteProcessingApproval(int ano) {
		
		int result = approvalDao.deleteProcessingApproval(sqlSession, ano);
		
		if(result < 0) {
			throw new CommException("결재 삭제 실패");
		}
		
	}

	//결재 완료 문서함 수
	@Override
	public int selectProcessedAppListCount(String empId) {
		
		return approvalDao.selectProcessedAppListCount(sqlSession, empId);
	}
	
	//결재완료문서함 리스트
	@Override
	public ArrayList<Approval> selectProcessedAppList(PageInfo pi, String empId) {

		return approvalDao.selectProcessedAppList(sqlSession, pi, empId);
	}

	//결재완료문서보기
	@Override
	public Approval selectProcessedAppDetail(int ano) {
		
		return approvalDao.selectProcessedAppDetail(sqlSession, ano);
	}
	
	//휴가정보 가져오기
	@Override
	public Holiday selectHoliday(int ano) {
		
		return approvalDao.selectHoliday(sqlSession, ano);
	}
	
	//연차 되돌리기
	@Override
	public void increaseCount(Holiday hol) {
		
		int result = approvalDao.increaseCount(sqlSession, hol);
		
		if(result < 0) {
			throw new CommException("연차개수 변경 실패");
		}
		
	}
	
	//휴가정보삭제
	@Override
	public void deleteHoliday(int ano) {
		
		int result = approvalDao.deleteHoliday(sqlSession, ano);
		
		if(result < 0) {
			throw new CommException("휴가 삭제 실패");
		}
		
	}
	
	//결재문서 삭제
	@Override
	public void deleteProcessedApproval(int ano) {

		int result = approvalDao.deleteProcessedApproval(sqlSession, ano);
		
		if(result < 0) {
			throw new CommException("결재 완료 문서 삭제 실패");
		}
	}
	
	//외근 승인시 db에 추가
	@Override
	public void insertOutwork(Outwork out) {
		
		int result = approvalDao.insertOutwork(sqlSession, out);
		
		if(result < 0) {
			throw new CommException("외근 추가 실패");
		}
	}
	
	//외근내역 삭제
	@Override
	public void deleteOutwork(int ano) {
		
		int result = approvalDao.deleteOutwork(sqlSession, ano);
		
		if(result < 0) {
			throw new CommException("외근 삭제 실패");
		}
		
	}
	
	//메인 진행중 결재함
	@Override
	public ArrayList<Approval> mainAppingList(String empId) {
		return approvalDao.mainAppingList(sqlSession, empId);
	}

	@Override
	public ArrayList<Approval> mainAppAskList(String empId) {
		return approvalDao.mainAppAskList(sqlSession, empId);
	}

	@Override
	public ArrayList<Approval> mainAppedList(String empId) {
		return approvalDao.mainAppedList(sqlSession, empId);
	}

	@Override
	public int selectCountNoApp(String empId) {
		
		return approvalDao.selectCountNoApp(sqlSession, empId);
	}


}
