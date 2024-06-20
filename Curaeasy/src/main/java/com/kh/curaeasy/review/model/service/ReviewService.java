package com.kh.curaeasy.review.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

}
