package com.kh.curaeasyadmin.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.curaeasyadmin.model.vo.Display;


@Repository
public class AdminDao {

	public ArrayList<Display> mainPageSelectDisplayList(SqlSessionTemplate sqlSession) {
		return (ArrayList) sqlSession.selectList("adminMapper.mainPageSelectDisplayList", null);
	}
}
