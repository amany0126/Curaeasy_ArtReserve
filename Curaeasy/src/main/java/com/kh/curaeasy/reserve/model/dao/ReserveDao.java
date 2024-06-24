package com.kh.curaeasy.reserve.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.curaeasy.reserve.model.vo.Reserve;

@Repository
public class ReserveDao {

	public int insertReserve(SqlSessionTemplate sqlSession, Reserve r) {
		return sqlSession.insert("reserveMapper.insertReserve", r);
	}

	public Reserve selectLastInsertedReserve(SqlSessionTemplate sqlSession, String memberNo) {
		return sqlSession.selectOne("reserveMapper.selectLastInsertedReserve", memberNo);
	}

	public ArrayList<Reserve> selectReserveList(SqlSessionTemplate sqlSession, int memberNo) {
		return (ArrayList) sqlSession.selectList("reserveMapper.selectReserveList", memberNo);
	}

	public Reserve selectReserve(SqlSessionTemplate sqlSession, int reserveNo) {
		return sqlSession.selectOne("reserveMapper.selectReserve", reserveNo);
	}

	public int deleteReview(SqlSessionTemplate sqlSession, Reserve re) {
		return sqlSession.update("reserveMapper.deleteReview", re);
	}
	
}
