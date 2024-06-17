package com.kh.curaeasy.notice.model.service;

import java.util.ArrayList;

import com.kh.curaeasy.common.model.vo.PageInfo;
import com.kh.curaeasy.notice.model.vo.Notice;

public interface NoticeService {

	// 게시판 리스트 조회 서비스 + 페이징 처리
	// 게시글 총 갯수 조회
	int selectListCount();
	
	// 게시글 리스트 조회
	ArrayList<Notice> selectList(PageInfo pi);

	// 게시글 상세조회 서비스
	// 게시글 조회수 증가
	int increaseCount(int noticeNo);
	
	// 게시글 상세 조회
	Notice selectNotice(int noticeNo);
	
	
	
	
	
	/* 이건 관리자만가능
	// 게시글 삭제 서비스
	int deleteNotice(int noticeNo);
	
	// 게시글 수정 서비스
	int updateNotice(Notice b);
	*/
	/*
	// 댓글 리스트 조회 서비스 - ajax
	ArrayList<Reply> selectReplyList(int noticeNo);
	
	// 댓글 작성 서비스 - ajax
	int insertReply(Reply r);
	
	// 조회수 top5 리스트 조회용 서비스 - ajax
	ArrayList<Notice> selectTopNoticeList();
	*/
}
