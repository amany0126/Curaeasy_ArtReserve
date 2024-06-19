package com.kh.curaeasy.rental.model.dao;

import java.sql.Date;
import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.curaeasy.rental.model.vo.Rental;

@Repository
public class RentalDao {

	public ArrayList<Rental> calendar(SqlSessionTemplate sqlSession, int gno) {
		return (ArrayList)sqlSession.selectList("rentalMapper.calendar",gno);
	}

	public int ValidDate(SqlSessionTemplate sqlSession, Rental rn) {
		return sqlSession.selectOne("rentalMapper.ValidDate", rn);
	}

	public int dayCheck(SqlSessionTemplate sqlSession, Rental rn) {
		return sqlSession.selectOne("rentalMapper.dayCheck", rn);
	}

	public int checkEndDay(SqlSessionTemplate sqlSession, Rental rn) {
		return sqlSession.selectOne("rentalMapper.checkEndDay", rn);
	}

	public int checkStdDay(SqlSessionTemplate sqlSession, Rental rn) {
		return sqlSession.selectOne("rentalMapper.checkStdDay", rn);
	}

	public int artistNo(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.selectOne("artistMapper.artistNo", userNo);
	}

	public int result(SqlSessionTemplate sqlSession, Rental r) {
		return sqlSession.insert("rentalMapper.result", r);
	}

	public ArrayList<Rental> selectMyLentalList(SqlSessionTemplate sqlSession, int artistNo) {
		return (ArrayList)sqlSession.selectList("rentalMapper.selectMyLentalList",artistNo);
	}

}
