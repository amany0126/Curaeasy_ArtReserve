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

    public ArrayList<Display> selectDisplayList() {
        return adminDao.selectDisplayList(sqlSession);
    }
    
    public ArrayList<Gallery> selectGalleryList() {
        return adminDao.selectGalleryList(sqlSession);
    }

    public ArrayList<Rental> selectRentalList() {
        return adminDao.selectRentalList(sqlSession);
    }

    public ArrayList<Reserve> selectReserveList() {
        return adminDao.selectReserveList(sqlSession);
    }

    public ArrayList<Member> selectMemberList() {
        return adminDao.selectMemberList(sqlSession);
    }

    public ArrayList<Artist> selectArtistList() {
        return adminDao.selectArtistList(sqlSession);
    }

    public ArrayList<Notice> selectNoticeList() {
        return adminDao.selectNoticeList(sqlSession);
    }

    public ArrayList<Review> selectReviewList() {
        return adminDao.selectReviewList(sqlSession);
    }
    
    public ArrayList<Reply> selectReplyList() {
        return adminDao.selectReplyList(sqlSession);
    }
}
