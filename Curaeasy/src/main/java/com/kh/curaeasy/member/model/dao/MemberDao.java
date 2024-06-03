package com.kh.curaeasy.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.curaeasy.member.model.vo.Cert;
import com.kh.curaeasy.member.model.vo.Member;

@Repository
public class MemberDao {

	public int insertMember(SqlSessionTemplate sqlSession, Member m) {
		System.out.println(m);
		return sqlSession.insert("memberMapper.insertMember", m);
	}

	public int idCheck(SqlSessionTemplate sqlSession, String checkId) {
		return sqlSession.selectOne("memberMapper.idCheck", checkId);
	}

	public int getCertNo(SqlSessionTemplate sqlSession, Cert c) {
		return sqlSession.insert("memberMapper.getCertNo", c);
	}

	public int reCert(SqlSessionTemplate sqlSession, Cert c) {
		return sqlSession.update("memberMapper.reCert", c);
	}

	public int validate(SqlSessionTemplate sqlSession, Cert c) {
		return sqlSession.delete("memberMapper.validate", c);
	}

	public Member loginMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.loginMember", m);
	}

}
