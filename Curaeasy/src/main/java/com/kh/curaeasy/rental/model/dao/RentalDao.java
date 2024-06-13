package com.kh.curaeasy.rental.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.curaeasy.rental.model.vo.Rental;

@Repository
public class RentalDao {

	public ArrayList<Rental> calendar(SqlSessionTemplate sqlSession, String gno) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("rentalMapper.calendar",gno);
	}

}
