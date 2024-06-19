package com.kh.curaeasy.reserve.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.curaeasy.reserve.model.dao.ReserveDao;
import com.kh.curaeasy.reserve.model.vo.Reserve;

@Service
public class ReserveService {
	
	@Autowired
	private ReserveDao rDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Transactional
	public int insertReserve(Reserve r) {
		return rDao.insertReserve(sqlSession, r);
	}

	public Reserve selectLastInsertedReserve() {
		return rDao.selectLastInsertedReserve(sqlSession);
	}
}
