package com.kh.curaeasyadmin.notice.model.service;

import java.util.ArrayList;

import com.kh.curaeasyadmin.common.model.vo.PageInfo;
import com.kh.curaeasyadmin.member.model.vo.AdminMember;

public interface AdminNoticeService {
	
	// 게시판 리스트 조회 서비스 + 페이징 처리
	// 게시글 총 갯수 조회
	static int selectListCount() {
		return 0;
	}
	// 게시글 리스트 조회
	static ArrayList<AdminMember> selectList(PageInfo pi) {
		return null;
	}
	
	// 게시글 작성하기 서비스
	int insertAdmember(AdminMember am);

	// 게시글 상세조회 서비스
	// 게시글 조회수 증가
	int increaseCount(int memberNo);
	// 게시글 상세 조회
	
	AdminMember selectMember(int memberNo);
	
	// 게시글 삭제 서비스
	int deleteBoard(int memberNo);
	
	// 게시글 수정 서비스
	int updateBoard(AdminMember am);
	/*
	// 댓글 리스트 조회 서비스 - ajax
	ArrayList<Reply> selectReplyList(int memberNo);
	
	// 댓글 작성 서비스 - ajax
	int insertReply(Reply r);
	
	// 조회수 top5 리스트 조회용 서비스 - ajax
	ArrayList<Board> selectTopBoardList();
	*/


}
