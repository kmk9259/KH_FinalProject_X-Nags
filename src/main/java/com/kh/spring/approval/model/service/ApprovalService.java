package com.kh.spring.approval.model.service;

import java.util.ArrayList;

import com.kh.spring.approval.model.vo.Approval;
import com.kh.spring.employee.model.vo.Employee;
import com.kh.spring.holiday.model.vo.Holiday;
import com.kh.spring.approval.model.vo.PageInfo;

public interface ApprovalService {

	void insertApproval(Approval app);

	int selectApprovalListCount(String empId);

	ArrayList<Approval> selectApprovalList(PageInfo pi, String empId);

	int selectAskApprovalListCount(String empId);

	ArrayList<Approval> selectAskApprovalList(PageInfo pi, String empId);

	Approval selectAskApprovalDetail(int ano);

	Employee selectAppWriter(String empId);

	Employee selectAppMid(String appMid);

	Employee selectAppFin(String appFin);

	void midConfirm(Approval app);

	void midReject(Approval app);

	void insertOneDay(Holiday hol);

	void finConfirm(Approval app);

	void finReject(Approval app);

	/* void insertHoliday(Approval app); */

}
