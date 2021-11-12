package com.kh.spring.supplies.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.supplies.model.dao.SuppliesDao;
import com.kh.spring.supplies.model.vo.Sitems;
import com.kh.spring.supplies.model.vo.Supplies;

@Service
public class SuppliesServiceImpl implements SuppliesService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private SuppliesDao suppliesDao;

	@Override
	public ArrayList<Sitems> selectSitems() {
		// TODO Auto-generated method stub
		return suppliesDao.selectSitems(sqlSession);
	}
	
	
}
