package com.kh.curaeasy.review.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.curaeasy.review.model.vo.Review;

@Repository
public class ReviewDao {

	public ArrayList<Review> myReviewList(SqlSessionTemplate sqlSession, int userNo) {
		return (ArrayList)sqlSession.selectList("reviewMapper.myReviewList",userNo);
	}

}
