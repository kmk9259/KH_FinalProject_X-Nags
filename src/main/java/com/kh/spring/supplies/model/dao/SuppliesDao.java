package com.kh.spring.supplies.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.supplies.model.vo.Sitems;
import com.kh.spring.supplies.model.vo.Supplies;

@Repository
public class SuppliesDao {

	public ArrayList<Sitems> selectSitems(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("sitemsMapper.selectSitems");
	}

	

}
