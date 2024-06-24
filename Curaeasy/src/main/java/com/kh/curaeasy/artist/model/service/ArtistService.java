package com.kh.curaeasy.artist.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.curaeasy.artist.model.dao.ArtistDao;
import com.kh.curaeasy.artist.model.vo.Artist;
@Service
public class ArtistService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ArtistDao artistDao;
	
	public int NickNameCheck(String checkNickName) {
		return artistDao.NickNameCheck(sqlSession, checkNickName);
	}
	
	@Transactional
	public int insertArtist(Artist at) {
		return artistDao.insertArtist(sqlSession, at);
	}

	public ArrayList<Artist> selectArtistList() {
		return artistDao.selectArtistList(sqlSession);
	}

	public int selectArtistNo(int memberNo) {
		return artistDao.selectArtistNo(sqlSession,memberNo);
	}

	public Artist ArtistDate(int memberNo) {
		return artistDao.ArtistDate(sqlSession,memberNo);
	}
	@Transactional
	public int updateArtist(Artist at) {
		// TODO Auto-generated method stub
		return artistDao.updateArtist(sqlSession,at);
	}

}
