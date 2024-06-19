package com.kh.curaeasy.reserve.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.curaeasy.reserve.model.vo.Reserve;

@Repository
public class ReserveDao {

	public int insertReserve(SqlSessionTemplate sqlSession, Reserve r) {
		return sqlSession.insert("reserveMapper.insertReserve", r);
	}

	public Reserve selectLastInsertedReserve(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("reserveMapper.selectLastInsertedReserve", null);
	}
	
}
