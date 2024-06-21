package com.kh.curaeasy.review.model.service;

import java.util.ArrayList;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.curaeasy.common.model.vo.PageInfo;
import com.kh.curaeasy.review.model.dao.ReviewDao;
import com.kh.curaeasy.review.model.vo.Reply;
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
	public ArrayList<String> myNoReviewList(int userNo) {
		return reviewDao.myNoReviewList(sqlSession,userNo);
	}
	@Transactional
	public int insertReview(Review r, Map<String, String> reviewListData) {	
		return  reviewDao.insertReview(sqlSession,r)*reviewDao.upDateMyReviewList(sqlSession,reviewListData);
	
	}

	public Review updateData(Review r) {
		return reviewDao.updateData(sqlSession,r);
	}

	@Transactional
	public int updateReview(Review r) {
		return reviewDao.updateReview(sqlSession,r);
	}




	public ArrayList<Reply> selectReplyList(int rno) {
		return reviewDao.selectReplyList(sqlSession, rno);
	}

	@Transactional
	public int insertReply(Reply r) {
		return reviewDao.insertReply(sqlSession, r);
	}
	
	@Transactional
	public int updateReply(Reply r) {
		return reviewDao.updateReply(sqlSession, r);
	}

	@Transactional
	public int deleteReply(Reply r) {
		return reviewDao.deleteReply(sqlSession, r);
	}

	@Transactional
	public int deleteReview(Review r) {
		return reviewDao.deleteAllReply(sqlSession, r) * reviewDao.deleteReview(sqlSession, r);

	public Review selectReview(int rno) {
		return reviewDao.selectReview(sqlSession, rno);
	}
}
