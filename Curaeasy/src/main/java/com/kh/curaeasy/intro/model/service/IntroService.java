package com.kh.curaeasy.intro.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.curaeasy.artist.model.vo.Artist;
import com.kh.curaeasy.display.model.vo.Display;
import com.kh.curaeasy.intro.model.dao.IntroDao;
import com.kh.curaeasy.notice.model.vo.Notice;

@Service
public class IntroService {
	
	@Autowired
	private IntroDao introDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 메인 페이지에 표시할 전시 1개 가져오기
	public Display SelectLatestDisplay() {
		return introDao.selectLatestDisplay(sqlSession);
	}
	
	// 메인 페이지에 표시할 작가 1개 가져오기
	public Artist SelectLatestArtist() {
		return introDao.selectLatestArtist(sqlSession);
	}

	// 메인 페이지에 표시할 공지 1개 가져오기
	public Notice SelectLatestNotice() {
		return introDao.selectLatestNotice(sqlSession);
	}
	
}
