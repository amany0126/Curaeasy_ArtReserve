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

	public int updateMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("memberMapper.updateMember", m);
	}

	public int deleteMember(SqlSessionTemplate sqlSession, String memberId) {
		return sqlSession.update("memberMapper.deleteMember", memberId);
	}

	public int changePwd(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("memberMapper.changePwd", m);
	}

	public String findId(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.findId", m);
	}

	public int findPwd(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("memberMapper.findPwd", m);
	}

	public int delectEmailcheck(SqlSessionTemplate sqlSession, Cert c) {
		return sqlSession.delete("memberMapper.delectEmailcheck", c);
	}

}
