package com.kh.spring.approval.model.service;

import java.util.ArrayList;

import com.kh.spring.approval.model.vo.Approval;
import com.kh.spring.mail.model.vo.PageInfo;

public interface ApprovalService {

	void insertApproval(Approval app);

	int selectApprovalListCount(String empId);

	ArrayList<Approval> selectApprovalList(PageInfo pi, String empId);

}
