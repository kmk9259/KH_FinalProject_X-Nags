package com.kh.spring.supplies.model.service;

import java.util.ArrayList;

import com.kh.spring.member.model.vo.Member;
import com.kh.spring.supplies.model.vo.Return;
import com.kh.spring.supplies.model.vo.Sitems;
import com.kh.spring.supplies.model.vo.Supplies;

public interface SuppliesService {

	ArrayList<Sitems> selectSitems();

	void insertSupplies(Supplies supplies);

	ArrayList<Return> updateForm(int empId);

	ArrayList<Return> selectReSuplist();

	Return updateDate(Return sup);





	


	

}
