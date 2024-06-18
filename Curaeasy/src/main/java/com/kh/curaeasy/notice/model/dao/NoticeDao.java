package com.kh.curaeasy.notice.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.curaeasy.common.model.vo.PageInfo;
import com.kh.curaeasy.notice.model.vo.Notice;

@Repository
public class NoticeDao {
	
public int selectListCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("noticeMapper.selectListCount");
	}
	

	 public ArrayList<Notice> selectList(SqlSessionTemplate sqlSession, PageInfo pi) {
	  
	 int limit = pi.getBoardLimit(); int offset = (pi.getCurrentPage() - 1) *limit;
	  
	 RowBounds rowBounds = new RowBounds(offset, limit);
	 
	 return (ArrayList)sqlSession.selectList("noticeMapper.selectList", null,
	 rowBounds); }
	
	public int insertNotice(SqlSessionTemplate sqlSession, Notice n) {
		
		return sqlSession.insert("noticeMapper.insertNotice", n);
	}
	
	public int increaseCount(SqlSessionTemplate sqlSession, int noticeNo) {
		
		return sqlSession.update("noticeMapper.increaseCount", noticeNo);
	}
	
	public Notice selectNotice(SqlSessionTemplate sqlSession, int noticeNo) {
		
		return sqlSession.selectOne("noticeMapper.selectNotice", noticeNo);
	}
	
	
	
	
	/* 관리자
	
	public int deleteNotice(SqlSessionTemplate sqlSession, int noticeNo) {
		
		return sqlSession.update("noticeMapper.deleteNotice", noticeNo);
	}
	
	public int updateBoard(SqlSessionTemplate sqlSession, Notice n) {
		
		return sqlSession.update("noticeMapper.updateNotice", n);
	}
	
	*/
	
	/*
	public ArrayList<Reply> selectReplyList(SqlSessionTemplate sqlSession, int noticeNo) {
		
		return (ArrayList)sqlSession.selectList("boardMapper.selectReplyList", noticeNo);
	}

	public int insertReply(SqlSessionTemplate sqlSession, Reply r) {
		
		return sqlSession.insert("noticeMapper.insertReply", r);
	}

	public ArrayList<Notice> selectTopNoticeList(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("noticeMapper.selectTopNoticeList");
	}
	*/
}
