package com.kh.curaeasy.review.model.dao;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.curaeasy.common.model.vo.PageInfo;
import com.kh.curaeasy.review.model.vo.Reply;
import com.kh.curaeasy.review.model.vo.Review;

@Repository
public class ReviewDao {

	public ArrayList<Review> myReviewList(SqlSessionTemplate sqlSession, int userNo) {
		return (ArrayList)sqlSession.selectList("reviewMapper.myReviewList",userNo);
	}
	public int selectListAllCount(SqlSessionTemplate sqlSession,String search) {
		return sqlSession.selectOne("reviewMapper.selectListAllCount",search);
	}
	public ArrayList<Review> selectAllList(SqlSessionTemplate sqlSession, PageInfo pi, String search) {
		int limit =  pi.getBoardLimit();		
		int offset = (pi.getCurrentPage()-1)*limit;
		RowBounds rowBounds = new RowBounds(offset, limit) ;
		return (ArrayList)sqlSession.selectList("reviewMapper.selectAllList",search, rowBounds);
	}
	
	
	public int selectTitleListCount(SqlSessionTemplate sqlSession,String search) {
		return sqlSession.selectOne("reviewMapper.selectTitleListCount", search);
	}
	public ArrayList<Review> selectTitleList(SqlSessionTemplate sqlSession, PageInfo pi,String search) {
		int limit =  pi.getBoardLimit();		
		int offset = (pi.getCurrentPage()-1)*limit;
		RowBounds rowBounds = new RowBounds(offset, limit) ;
		return (ArrayList)sqlSession.selectList("reviewMapper.selectTitleList", search, rowBounds);
	}
	
	
	public int selectWriterListCount(SqlSessionTemplate sqlSession,String search) {
		return sqlSession.selectOne("reviewMapper.selectWriterListCount", search);
	}
	public ArrayList<Review> selectWriterList(SqlSessionTemplate sqlSession, PageInfo pi,String search) {
		int limit =  pi.getBoardLimit();		
		int offset = (pi.getCurrentPage()-1)*limit;
		RowBounds rowBounds = new RowBounds(offset, limit) ;
		return (ArrayList)sqlSession.selectList("reviewMapper.selectWriterList", search, rowBounds);
	}
	public int ticket(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.selectOne("reviewMapper.ticket",userNo);
	}
	public ArrayList<String> myNoReviewList(SqlSessionTemplate sqlSession, int userNo) {
		return (ArrayList)sqlSession.selectList("reviewMapper.myNoReviewList",userNo);
	}
	public int insertReview(SqlSessionTemplate sqlSession, Review r) {
		return sqlSession.insert("reviewMapper.insertReview", r);
	}
	public int upDateMyReviewList(SqlSessionTemplate sqlSession, Map<String, String> reviewListData) {
		return sqlSession.update("reviewMapper.upDateMyReviewList",reviewListData);
	}
	public Review updateData(SqlSessionTemplate sqlSession, Review r) {
		return sqlSession.selectOne("reviewMapper.updateData",r);
	}
	public int updateReview(SqlSessionTemplate sqlSession, Review r) {
		// TODO Auto-generated method stub
		return sqlSession.update("reviewMapper.updateReview",r);
	}


	public ArrayList<Reply> selectReplyList(SqlSessionTemplate sqlSession, int rno) {
		return (ArrayList)sqlSession.selectList("reviewMapper.selectReplyList", rno);
	}

	public int insertReply(SqlSessionTemplate sqlSession, Reply r) {
		return sqlSession.insert("reviewMapper.insertReply", r);
	}

	public int updateReply(SqlSessionTemplate sqlSession, Reply r) {
		return sqlSession.update("reviewMapper.updateReply", r);
	}

	public int deleteReply(SqlSessionTemplate sqlSession, Reply r) {
		return sqlSession.delete("reviewMapper.deleteReply", r);
	}

}
