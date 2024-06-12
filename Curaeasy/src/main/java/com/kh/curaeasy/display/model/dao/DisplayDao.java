package com.kh.curaeasy.display.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.curaeasy.display.model.vo.Display;
import com.kh.curaeasy.display.model.vo.DisplayAttachment;

@Repository
public class DisplayDao {

	// 현재 진행중인 전시 리스트 가져오기
	public ArrayList<Display> mainPageSelectDisplayList(SqlSessionTemplate sqlSession) {
		return (ArrayList) sqlSession.selectList("displayMapper.mainPageSelectDisplayList", null);
	}

	public int insertDisplay(SqlSessionTemplate sqlSession, Display d, ArrayList<DisplayAttachment> fileList) {
		// TODO Auto-generated method stub
		int result = sqlSession.insert("displayMapper.insertDisplay", d);
		for (DisplayAttachment item : fileList) {
			result *= sqlSession.insert("displayMapper.insertDisplayAttachment", item);
		}
		return result;
	}

}
