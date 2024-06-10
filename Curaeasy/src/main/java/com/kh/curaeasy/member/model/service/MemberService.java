package com.kh.curaeasy.member.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.curaeasy.member.model.dao.MemberDao;
import com.kh.curaeasy.member.model.vo.Cert;
import com.kh.curaeasy.member.model.vo.Member;

@Service
public class MemberService {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private MemberDao memberDao;
	
	@Transactional 
	public int insertMember(Member m) {
		int result = memberDao.insertMember(sqlSession, m);
		// 트랜잭션을 관리해주는 빈 등록
		// > 자동으로 트랜잭션 관리
		return result;
	}
	

	public int idCheck(String checkId) {
		return memberDao.idCheck(sqlSession, checkId);
	}
	
	@Transactional 
	public int getCertNo(Cert c) {
		int result = memberDao.getCertNo(sqlSession, c);
		// 트랜잭션을 관리해주는 빈 등록
		// > 자동으로 트랜잭션 관리
		return result;
	}
	@Transactional 
	public int reCert(Cert c) {
		int result = memberDao.reCert(sqlSession, c);
		return result;
	}
	@Transactional 
	public int validate(Cert c) {
		int result = memberDao.validate(sqlSession, c);
		// 트랜잭션을 관리해주는 빈 등록
		// > 자동으로 트랜잭션 관리
		return result;
	}


	public Member loginMember(Member m) {
		Member loginUser = memberDao.loginMember(sqlSession, m);
		return loginUser;
	}

	@Transactional 
	public int updateMember(Member m) {
	
		return memberDao.updateMember(sqlSession, m);
	}

	@Transactional 
	public int deleteMember(String memberId) {
		return memberDao.deleteMember(sqlSession, memberId);
	}

	@Transactional 
	public int changePwd(Member m) {
		return memberDao.changePwd(sqlSession, m);
	}


	public String findId(Member m) {
		return memberDao.findId(sqlSession, m);
	}


	public int findPwd(Member m) {
		return memberDao.findPwd(sqlSession, m);
	}


	public int delectEmailcheck(Cert c) {
		return memberDao.delectEmailcheck(sqlSession, c);
	}

}
