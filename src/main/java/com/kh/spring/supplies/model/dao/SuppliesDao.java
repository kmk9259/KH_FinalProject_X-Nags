package com.kh.spring.supplies.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.supplies.model.vo.PageInfo;
import com.kh.spring.member.model.vo.Member;
import com.kh.spring.supplies.model.vo.Return;
import com.kh.spring.supplies.model.vo.Sitems;
import com.kh.spring.supplies.model.vo.Supplies;	

@Repository
public class SuppliesDao {

	public ArrayList<Sitems> selectSitems(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("sitemsMapper.selectSitems");
	}

	public int insertSupplies(SqlSessionTemplate sqlSession, Supplies supplies) {
	
		return sqlSession.insert("suppliesMapper.insertSupplies",supplies);
	}


	public ArrayList<Return> updateForm(SqlSessionTemplate sqlSession, int empId) {
		// TODO Auto-generated method stub
		return (ArrayList) sqlSession.selectList("suppliesMapper.updateForm", empId);
	}

	public ArrayList<Supplies> insertCode(SqlSessionTemplate sqlSession, ArrayList<Supplies> suplist) {
		// TODO Auto-generated method stub
		return (ArrayList) sqlSession.selectList("suppliesMapper.insertCode", suplist);
	}

	public ArrayList<Return> selectReSuplist(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("suppliesMapper.selectReSuplist");
	}



	public int updateSupplies(SqlSessionTemplate sqlSession, Return re) {
		// TODO Auto-generated method stub
		return sqlSession.update("suppliesMapper.updateSupplies", re);
	}

	public int updateSupplies(SqlSessionTemplate sqlSession, ArrayList<Return> re) {
		// TODO Auto-generated method stub
		return sqlSession.update("suppliesMapper.updateSupplies", re);
	}

	public Return selectItem(SqlSessionTemplate sqlSession, int reNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("suppliesMapper.updateSupplies", reNo);
	}

	public int returnSup(SqlSessionTemplate sqlSession, int reNo) {
		// TODO Auto-generated method stub
		return sqlSession.delete("suppliesMapper.returnSup", reNo);
	}

	public int selectListCount(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("suppliesMapper.selectListCount");
	}






	

	

	
	
	


















	

}
