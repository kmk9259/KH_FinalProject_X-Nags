package com.kh.spring.supplies.model.service;

import java.sql.Date;
import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.common.exception.CommException;
import com.kh.spring.supplies.model.vo.PageInfo;
import com.kh.spring.member.model.dao.MemberDao;
import com.kh.spring.member.model.vo.Member;
import com.kh.spring.supplies.model.dao.SuppliesDao;
import com.kh.spring.supplies.model.vo.Return;
import com.kh.spring.supplies.model.vo.Sitems;
import com.kh.spring.supplies.model.vo.Supplies;

@Service
public class SuppliesServiceImpl implements SuppliesService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private SuppliesDao suppliesDao;
	
	@Autowired
	private MemberDao memberDao;

	@Override
	public ArrayList<Sitems> selectSitems() {
		// TODO Auto-generated method stub
		return suppliesDao.selectSitems(sqlSession);
		
	}

	@Override
	public void insertSupplies(Supplies supplies) {
		int result = suppliesDao.insertSupplies(sqlSession, supplies);
		
		if(result > 0) {
			String[] sCode = supplies.getSuppliesCode().split(",");
			String[] sName = supplies.getSuppliesName().split(",");
			String[] sCounts = supplies.getCounts().split(",");
			for(int i=0; i <sCode.length; i++) {
				
				String code = supplies.getSuppliesCode();
				code += sCode[i];
				
				System.out.println("code " + code);
				

				String empId = supplies.getEmpId();
				Date startDate = supplies.getStartDate();
				Date endDate = supplies.getEndDate();
				String status = supplies.getStatus();
				
				ArrayList<Supplies> suplist = new ArrayList<Supplies>();
				
				
				
				Supplies su = new Supplies(sCode[i], empId, sName[i], sCounts[i], startDate, endDate, status);
				
				suplist.add(su);

				suplist = suppliesDao.insertCode(sqlSession, suplist);
				
			}
		}

		if (result < 0) {
			throw new CommException("비품 예약 실패");
		}
	}



	@Override
	public ArrayList<Return> updateForm(int empId) {
		
		return suppliesDao.updateForm(sqlSession, empId);
	}


	

	@Override
	public ArrayList<Return> selectReSuplist() {
		
		return suppliesDao.selectReSuplist(sqlSession);
	}

	@Override
	public void returnSup(int reNo) {
		int result = suppliesDao.returnSup(sqlSession, reNo);
		if(result <0) {
			throw new CommException("비품반납 실패");
		}
		
	}

	@Override
	public int selectListCount() {
		// TODO Auto-generated method stub
		return suppliesDao.selectListCount(sqlSession);
	}

	@Override
	public void updateSupplies(Return re) {
		int result = suppliesDao.updateSupplies(sqlSession, re);
		if (result < 0) {
			throw new CommException("기간 연장 실패");
		}
		
	}

	@Override
	public ArrayList<Supplies> mySupList(String empId) {
		
		return suppliesDao.mySupList(sqlSession, empId);
	}

	@Override
	public ArrayList<Return> updateForm(String empId) {
		
		return suppliesDao.updateForm(sqlSession, empId);
	}







	
	





	
	
}
