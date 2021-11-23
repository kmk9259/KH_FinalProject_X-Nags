package com.kh.spring.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.member.model.vo.Member;

@Repository
public class MemberDao {

	public Member loginMember(SqlSessionTemplate sqlSession, String empId) {
		Member m1 = sqlSession.selectOne("memberMapper.loginMember",empId);

		return m1;
	}

	public int insertMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.insert("memberMapper.insertMember",m);
	}

	public int updateMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.insert("memberMapper.updateMember",m);
	}

	public int deleteMember(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.insert("memberMapper.deleteMember",userId);
	}

	public int updatePwd(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.insert("memberMapper.updatePwd",m);
	}

	public Member selectMem(SqlSessionTemplate sqlSession, int empId) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("memberMapper.selectMem", empId);
	}

	public int updatePic(SqlSessionTemplate sqlSession, Member m) {
		// TODO Auto-generated method stub
		return sqlSession.update("memberMapper.updatePic",m);
	}

	

}
