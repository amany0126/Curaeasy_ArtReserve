package com.kh.curaeasy.notice.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.curaeasy.common.model.vo.PageInfo;
import com.kh.curaeasy.notice.model.dao.NoticeDao;
import com.kh.curaeasy.notice.model.vo.Notice;

@Service
public class NoticeServiceImpl implements NoticeService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private NoticeDao noticeDao;

	@Override
	public int selectListCount() {
		return noticeDao.selectListCount(sqlSession);
	}

	@Override
	public ArrayList<Notice> selectList(PageInfo pi) {
		return noticeDao.selectList(sqlSession, pi);
	}

	@Override
	@Transactional
	public int increaseCount(int noticeNo) {
		return noticeDao.increaseCount(sqlSession, noticeNo);
	}

	@Override
	public Notice selectNotice(int noticeNo) {
		return noticeDao.selectNotice(sqlSession, noticeNo);
	}
	
	
	

	@Override
	public Integer getPreviousNoticeId(int noticeNo) {
	    return noticeDao.getPreviousNoticeId(sqlSession, noticeNo);
	}

	@Override
	public Integer getNextNoticeId(int noticeNo) {
	    return noticeDao.getNextNoticeId(sqlSession, noticeNo);
	}
	
	/* 관리자만가능
	@Override
	@Transactional
	public int deleteNotice(int noticeNo) {
		return noticeDao.deleteNotice(sqlSession, noticeNo);
	}

	@Override
	public int updateNotice(Notice n) {
		return noticeDao.updateBoard(sqlSession, n);
	}
	 */
	
}
