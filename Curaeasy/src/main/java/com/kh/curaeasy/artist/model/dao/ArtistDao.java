package com.kh.curaeasy.artist.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.curaeasy.artist.model.vo.Artist;

@Repository
public class ArtistDao {

	public int NickNameCheck(SqlSessionTemplate sqlSession, String checkNickName) {
		return sqlSession.selectOne("artistMapper.NickNameCheck", checkNickName);
	}

	public int insertArtist(SqlSessionTemplate sqlSession, Artist at) {
		return sqlSession.insert("artistMapper.insertArtist", at);
	}

}
