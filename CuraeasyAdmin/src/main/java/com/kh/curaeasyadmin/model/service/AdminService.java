package com.kh.curaeasyadmin.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.curaeasyadmin.model.dao.AdminDao;
import com.kh.curaeasyadmin.model.vo.*;

@Service
public class AdminService {

    @Autowired
    private AdminDao adminDao;
    
    @Autowired
    private SqlSessionTemplate sqlSession;

    // 메인 페이지
    public ArrayList<Display> mainPageSelectDisplayList() {
        return adminDao.mainPageSelectDisplayList(sqlSession);
    }

    public ArrayList<Notice> mainPageSelectNoticeList() {
        return adminDao.mainPageSelectNoticeList(sqlSession);
    }

    public ArrayList<Review> mainPageSelectReviewList() {
        return adminDao.mainPageSelectReviewList(sqlSession);
    }

    public ArrayList<Reply> mainPageSelectReplyList() {
        return adminDao.mainPageSelectReplyList(sqlSession);
    }

    public ArrayList<Rental> mainPageSelectRentalList() {
        return adminDao.mainPageSelectRentalList(sqlSession);
    }

    public ArrayList<Reserve> mainPageSelectReserveList() {
        return adminDao.mainPageSelectReserveList(sqlSession);
    }

    // 전시회 관리
    public ArrayList<Display> selectDisplayList() {
        return adminDao.selectDisplayList(sqlSession);
    }
    
    // 전시관 관리
    public ArrayList<Gallery> selectGalleryList() {
        return adminDao.selectGalleryList(sqlSession);
    }

    // 대관신청 관리
    public ArrayList<Rental> selectRentalList() {
        return adminDao.selectRentalList(sqlSession);
    }

    // 예매 관리
    public ArrayList<Reserve> selectReserveList() {
        return adminDao.selectReserveList(sqlSession);
    }

    // 회원 관리
    public ArrayList<Member> selectMemberList() {
        return adminDao.selectMemberList(sqlSession);
    }

    // 작가 관리
    public ArrayList<Artist> selectArtistList() {
        return adminDao.selectArtistList(sqlSession);
    }

    // 공지사항 관리
    public ArrayList<Notice> selectNoticeList() {
        return adminDao.selectNoticeList(sqlSession);
    }

    // 후기 관리
    public ArrayList<Review> selectReviewList() {
        return adminDao.selectReviewList(sqlSession);
    }
    
    // 댓글 관리
    public ArrayList<Reply> selectReplyList() {
        return adminDao.selectReplyList(sqlSession);
    }
}
