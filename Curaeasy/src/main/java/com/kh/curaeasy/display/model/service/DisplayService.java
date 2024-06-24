package com.kh.curaeasy.display.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.curaeasy.display.model.dao.DisplayDao;
import com.kh.curaeasy.display.model.vo.Display;
import com.kh.curaeasy.display.model.vo.DisplayAttachment;

@Service
public class DisplayService {

	@Autowired
	private DisplayDao displayDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 현재 진행중인 전시 리스트 가져오기(메인페이지)
	public ArrayList<Display> mainPageSelectDisplayList() {
		return displayDao.mainPageSelectDisplayList(sqlSession);
	}
	
	// 현재 진행중인 전시 리스트 가져오기
    public ArrayList<Display> selectOnDisplayList() {
        return displayDao.selectOnDisplayList(sqlSession);
    }
    
	// 진행 예정 전시리스트 가져오기
    public ArrayList<Display> selectUpcomingDisplayList() {
        return displayDao.selectUpcomingDisplayList(sqlSession);
    }
    
	// 지난 전시리스트 가져오기
    public ArrayList<Display> selectClosedDisplayList() {
        return displayDao.selectClosedDisplayList(sqlSession);
    }
	
	@Transactional
	public int insertDisplay(Display d, ArrayList<DisplayAttachment> fileList) {
		return displayDao.insertDisplay(sqlSession, d, fileList);
	}

	public Display selectDisplay(int dno) {
		return displayDao.selectDisplay(sqlSession, dno);
	}

	public ArrayList<DisplayAttachment> selectDisplayAttachment(int dno) {
		return displayDao.selectDisplayAttachment(sqlSession, dno);
	}

	public ArrayList<Display> selectOnDisplay() {
		return displayDao.selectOnDisplay(sqlSession);
	}

	public ArrayList<DisplayAttachment> selectOnDisplayThumbnail() {
		return displayDao.selectOnDisplayThumbnail(sqlSession);
	}

	public ArrayList<DisplayAttachment> mydisplayList(int artistNo) {
		return displayDao.mydisplayList(sqlSession,artistNo);
	}

	public ArrayList<Display> selectDisplayList() {
		return displayDao.selectDisplayList(sqlSession);
	}
	
}
