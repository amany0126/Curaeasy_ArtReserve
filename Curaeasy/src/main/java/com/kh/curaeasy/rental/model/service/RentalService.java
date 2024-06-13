package com.kh.curaeasy.rental.model.service;

import java.util.ArrayList;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.kh.curaeasy.rental.model.dao.RentalDao;
import com.kh.curaeasy.rental.model.vo.Rental;

@Service
public class RentalService {
	@Autowired
	private  SqlSessionTemplate sqlSession;
	
	@Autowired
	private RentalDao rentalDao;
	
	public ArrayList<Rental> calendar(String gno) {
		return rentalDao.calendar(sqlSession,gno);
	}

}
