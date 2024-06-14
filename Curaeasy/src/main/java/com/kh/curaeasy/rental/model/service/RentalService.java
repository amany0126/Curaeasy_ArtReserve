package com.kh.curaeasy.rental.model.service;

import java.sql.Date;
import java.util.ArrayList;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.curaeasy.rental.model.dao.RentalDao;
import com.kh.curaeasy.rental.model.vo.Rental;

@Service
public class RentalService {
	@Autowired
	private  SqlSessionTemplate sqlSession;
	
	@Autowired
	private RentalDao rentalDao;
	
	public ArrayList<Rental> calendar(int gno) {
		return rentalDao.calendar(sqlSession,gno);
	}

	public int ValidDate(Rental rn) {
		return rentalDao.ValidDate(sqlSession,rn);
	}

	public int dayCheck(Rental rn) {
		return rentalDao.dayCheck(sqlSession,rn);
	}

	public int checkEndDay(Rental rn) {
		return rentalDao.checkEndDay(sqlSession,rn);
	}

	public int checkStdDay(Rental rn) {
		return rentalDao.checkStdDay(sqlSession,rn);
	}

	public int artistNo(int userNo) {
		return rentalDao.artistNo(sqlSession,userNo);
	}
	
	@Transactional 
	public int result(Rental r) {
		return rentalDao.result(sqlSession,r);
	}


}
