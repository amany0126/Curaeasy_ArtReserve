package com.kh.curaeasyadmin.member.model.service;

import org.springframework.stereotype.Service;

import com.kh.curaeasyadmin.member.model.vo.AdminMember;
import com.kh.curaeasyadmin.notice.model.vo.AdminNotice;

@Service
public class AdminMemberServiceImpl implements AdminMemberService {

	/*
	@Override
	public int selectListCount() {
		return 0;
	}

	@Override
	public ArrayList<AdminMember> selectList(PageInfo pi) {
		return null;
	}
*/
	public int selectNoticeList(AdminMember am) {
		return 0;
		
	}
	
	@Override
	public int insertAdmember(AdminMember am) {
		return 0;
	}

	@Override
	public int increaseCount(int memberNo) {
		return 0;
	}

	@Override
	public AdminMember selectMember(int memberNo) {
		return null;
	}

	@Override
	public int deleteBoard(int memberNo) {
		return 0;
	}

	@Override
	public int updateBoard(AdminMember am) {
		return 0;
	}
	
	

}
