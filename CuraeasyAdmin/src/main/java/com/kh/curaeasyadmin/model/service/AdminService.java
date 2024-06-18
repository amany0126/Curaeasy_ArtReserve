package com.kh.curaeasyadmin.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.kh.curaeasyadmin.model.dao.AdminDao;
import com.kh.curaeasyadmin.model.vo.Display;

public class AdminService {

	@Autowired
	private AdminDao admindao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public ArrayList<Display> mainPageSelectDisplayList() {
		return admindao.mainPageSelectDisplayList(sqlSession);
	}
}
