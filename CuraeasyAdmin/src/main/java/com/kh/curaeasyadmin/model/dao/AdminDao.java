package com.kh.curaeasyadmin.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.curaeasyadmin.model.vo.*;

@Repository
public class AdminDao {

    public ArrayList<Display> mainPageSelectDisplayList(SqlSessionTemplate sqlSession) {
        return (ArrayList) sqlSession.selectList("adminMapper.mainPageSelectDisplayList");
    }

    public ArrayList<Notice> mainPageSelectNoticeList(SqlSessionTemplate sqlSession) {
        return (ArrayList) sqlSession.selectList("adminMapper.mainPageSelectNoticeList");
    }

    public ArrayList<Review> mainPageSelectReviewList(SqlSessionTemplate sqlSession) {
        return (ArrayList) sqlSession.selectList("adminMapper.mainPageSelectReviewList");
    }

    public ArrayList<Reply> mainPageSelectReplyList(SqlSessionTemplate sqlSession) {
        return (ArrayList) sqlSession.selectList("adminMapper.mainPageSelectReplyList");
    }

    public ArrayList<Rental> mainPageSelectRentalList(SqlSessionTemplate sqlSession) {
        return (ArrayList) sqlSession.selectList("adminMapper.mainPageSelectRentalList");
    }

    public ArrayList<Reserve> mainPageSelectReserveList(SqlSessionTemplate sqlSession) {
        return (ArrayList) sqlSession.selectList("adminMapper.mainPageSelectReserveList");
    }

    public ArrayList<Display> selectDisplayList(SqlSessionTemplate sqlSession) {
        return (ArrayList) sqlSession.selectList("adminMapper.selectDisplayList");
    }

    public ArrayList<Gallery> selectGalleryList(SqlSessionTemplate sqlSession) {
        return (ArrayList) sqlSession.selectList("adminMapper.selectGalleryList");
    }

    public ArrayList<Rental> selectRentalList(SqlSessionTemplate sqlSession) {
        return (ArrayList) sqlSession.selectList("adminMapper.selectRentalList");
    }

    public ArrayList<Reserve> selectReserveList(SqlSessionTemplate sqlSession) {
        return (ArrayList) sqlSession.selectList("adminMapper.selectReserveList");
    }

    public ArrayList<Member> selectMemberList(SqlSessionTemplate sqlSession) {
        return (ArrayList) sqlSession.selectList("adminMapper.selectMemberList");
    }

    public ArrayList<Artist> selectArtistList(SqlSessionTemplate sqlSession) {
        return (ArrayList) sqlSession.selectList("adminMapper.selectArtistList");
    }

    public ArrayList<Notice> selectNoticeList(SqlSessionTemplate sqlSession) {
        return (ArrayList) sqlSession.selectList("adminMapper.selectNoticeList");
    }

    public ArrayList<Review> selectReviewList(SqlSessionTemplate sqlSession) {
        return (ArrayList) sqlSession.selectList("adminMapper.selectReviewList");
    }
    
    public ArrayList<Reply> selectReplyList(SqlSessionTemplate sqlSession) {
        return (ArrayList) sqlSession.selectList("adminMapper.selectReplyList");
    }
}
