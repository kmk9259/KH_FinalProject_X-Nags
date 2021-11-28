package com.kh.spring.approval.model.service;

import java.util.ArrayList;

import com.kh.spring.approval.model.vo.Approval;
import com.kh.spring.approval.model.vo.Outwork;
import com.kh.spring.employee.model.vo.Employee;
import com.kh.spring.holiday.model.vo.Holiday;
import com.kh.spring.approval.model.vo.PageInfo;

public interface ApprovalService {
 
	void insertApproval(Approval app);

	int selectApprovalListCount(String empId);

	ArrayList<Approval> selectApprovalList(PageInfo pi, String empId);
	
	Approval selectApprovalDetail(int ano);

	int selectAskApprovalListCount(String empId);

	ArrayList<Approval> selectAskApprovalList(PageInfo pi, String empId);

	Approval selectAskApprovalDetail(int ano);

	Employee selectAppWriter(String empId);

	Employee selectAppMid(String appMid);

	Employee selectAppFin(String appFin);

	void midConfirm(Approval app);

	void midReject(Approval app);

	void insertHoliday(Holiday hol);

	void finConfirm(Approval app);

	void finReject(Approval app);

	void decreaseCount(Holiday hol);

	void updateApproval(Approval app);

	void deleteProcessingApproval(int ano);

	int selectProcessedAppListCount(String empId);

	ArrayList<Approval> selectProcessedAppList(PageInfo pi, String empId);

	Approval selectProcessedAppDetail(int ano);

	Holiday selectHoliday(int ano);

	void increaseCount(Holiday hol);

	void deleteHoliday(int ano);

	void deleteProcessedApproval(int ano);

	void insertOutwork(Outwork out);

	void deleteOutwork(int ano);

	ArrayList<Approval> mainAppingList(String empId);

	ArrayList<Approval> mainAppAskList(String empId);

	ArrayList<Approval> mainAppedList(String empId);

	int selectCountNoApp(String empId);

	
}
