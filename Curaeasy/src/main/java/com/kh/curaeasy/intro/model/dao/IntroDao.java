package com.kh.curaeasy.intro.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.curaeasy.artist.model.vo.Artist;
import com.kh.curaeasy.display.model.vo.Display;
import com.kh.curaeasy.notice.model.vo.Notice;

@Repository
public class IntroDao {

	public Display selectLatestDisplay(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("displayMapper.selectLatestDisplay", null);
	}

	public Artist selectLatestArtist(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("artistMapper.selectLatestArtist", null);
	}
	
	public Notice selectLatestNotice(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("noticeMapper.selectLatestNotice", null);
	}
	
}
