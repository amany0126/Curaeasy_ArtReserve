package com.kh.curaeasy.review.model.service;

import java.util.ArrayList;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.curaeasy.common.model.vo.PageInfo;
import com.kh.curaeasy.review.model.dao.ReviewDao;
import com.kh.curaeasy.review.model.vo.Review;

@Service
public class ReviewService {

	@Autowired
	private  SqlSessionTemplate sqlSession;
	
	@Autowired
	private ReviewDao reviewDao;

	
	public ArrayList<Review> myReviewList(int userNo) {
		return reviewDao.myReviewList(sqlSession,userNo);
	}


	public int selectListAllCount(String search) {
		return reviewDao.selectListAllCount(sqlSession,search);
	}


	
	public ArrayList<Review> selectAllList(PageInfo pi, String search) {
		return reviewDao.selectAllList(sqlSession,pi,search);
	}


	public int selectTitleListCount(String search) {
		return reviewDao.selectTitleListCount(sqlSession, search);
	}


	
	public ArrayList<Review> selectTitleList(PageInfo pi, String search) {
		return reviewDao.selectTitleList(sqlSession,pi, search);
	}

	public int selectWriterListCount(String search) {
		return reviewDao.selectWriterListCount(sqlSession, search);
	}


	public ArrayList<Review> selectWriterList(PageInfo pi, String search) {
		return reviewDao.selectWriterList(sqlSession,pi, search);
	}


	public int ticket(int userNo) {
		return reviewDao.ticket(sqlSession,userNo);
	}
}
