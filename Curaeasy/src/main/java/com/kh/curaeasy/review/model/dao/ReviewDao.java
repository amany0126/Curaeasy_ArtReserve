package com.kh.curaeasy.review.model.dao;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.curaeasy.common.model.vo.PageInfo;
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


}
