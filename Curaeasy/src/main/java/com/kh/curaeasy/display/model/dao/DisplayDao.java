package com.kh.curaeasy.display.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.curaeasy.display.model.vo.Display;
import com.kh.curaeasy.display.model.vo.DisplayAttachment;

@Repository
public class DisplayDao {

	// 현재 진행중인 전시 리스트 가져오기(메인)
	public ArrayList<Display> mainPageSelectDisplayList(SqlSessionTemplate sqlSession) {
		return (ArrayList) sqlSession.selectList("displayMapper.mainPageSelectDisplayList", null);
	}
	
	// 현재 진행중인 전시 리스트 가져오기
	public ArrayList<Display> selectOnDisplayList(SqlSessionTemplate sqlSession) {
		return (ArrayList) sqlSession.selectList("displayMapper.selectOnDisplayList", null);
	}
	
	// 진행 예정 전시 리스트 가져오기
	public ArrayList<Display> selectUpcomingDisplayList(SqlSessionTemplate sqlSession) {
		return (ArrayList) sqlSession.selectList("displayMapper.selectUpcomingDisplayList", null);
	}
	
	// 마감 전시 리스트 가져오기
	public ArrayList<Display> selectClosedDisplayList(SqlSessionTemplate sqlSession) {
		return (ArrayList) sqlSession.selectList("displayMapper.selectClosedDisplayList", null);
	}
	
	
	
	

	public int insertDisplay(SqlSessionTemplate sqlSession, Display d, ArrayList<DisplayAttachment> fileList) {
		// TODO Auto-generated method stub
		int result = sqlSession.insert("displayMapper.insertDisplay", d);
		for (DisplayAttachment item : fileList) {
			result *= sqlSession.insert("displayMapper.insertDisplayAttachment", item);
		}
		return result;
	}

	public Display selectDisplay(SqlSessionTemplate sqlSession, int dno) {
		return sqlSession.selectOne("displayMapper.selectDisplay", dno);
	}

	public ArrayList<DisplayAttachment> selectDisplayAttachment(SqlSessionTemplate sqlSession, int dno) {
		return (ArrayList) sqlSession.selectList("displayMapper.selectDisplayAttachment", dno);
	}

	public ArrayList<Display> selectOnDisplay(SqlSessionTemplate sqlSession) {
		return (ArrayList) sqlSession.selectList("displayMapper.selectOnDisplay", null);
	}

	public ArrayList<DisplayAttachment> selectOnDisplayThumbnail(SqlSessionTemplate sqlSession) {
		return (ArrayList) sqlSession.selectList("displayMapper.selectOnDisplayThumbnail", null);
	}

	public ArrayList<DisplayAttachment> mydisplayList(SqlSessionTemplate sqlSession, int artistNo) {
		return (ArrayList) sqlSession.selectList("displayMapper.mydisplayList", artistNo);
	}

}
