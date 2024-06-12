package com.kh.curaeasy.display.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.curaeasy.display.model.dao.DisplayDao;
import com.kh.curaeasy.display.model.vo.Display;

@Service
public class DisplayService {

	@Autowired
	private DisplayDao displayDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 현재 진행중인 전시 리스트 가져오기
	public ArrayList<Display> mainPageSelectDisplayList() {
		return displayDao.mainPageSelectDisplayList(sqlSession);
	}

}
