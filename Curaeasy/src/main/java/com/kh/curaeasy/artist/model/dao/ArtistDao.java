package com.kh.curaeasy.artist.model.dao;

import java.util.ArrayList;

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

	public ArrayList<Artist> selectArtistList(SqlSessionTemplate sqlSession) {
		return (ArrayList) sqlSession.selectList("artistMapper.selectArtistList", null);
	}

	public int selectArtistNo(SqlSessionTemplate sqlSession, int memberNo) {
		return sqlSession.selectOne("artistMapper.selectArtistNo", memberNo);
	}

	public Artist ArtistDate(SqlSessionTemplate sqlSession, int memberNo) {
		return sqlSession.selectOne("artistMapper.ArtistDate", memberNo);
	}

	public int updateArtist(SqlSessionTemplate sqlSession, Artist at) {
		return sqlSession.update("artistMapper.updateArtist", at);
	}

}
