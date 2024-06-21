package com.kh.curaeasyadmin.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.curaeasyadmin.common.model.vo.PageInfo;
import com.kh.curaeasyadmin.model.dao.AdminDao;
import com.kh.curaeasyadmin.model.vo.*;

@Service
public class AdminService {

    @Autowired
    private AdminDao adminDao;
    
    @Autowired
    private SqlSessionTemplate sqlSession;

    // 메인 페이지
    
    public int getDisplayListCount(String searchKeyword) {
        return adminDao.getDisplayListCount(sqlSession, searchKeyword);
    }

    public ArrayList<Display> selectDisplayList(PageInfo pi, String searchKeyword) {
        return adminDao.selectDisplayList(sqlSession, pi, searchKeyword);
    }
    
    public Display selectDisplay(int displayNo) {
        return adminDao.selectDisplay(sqlSession,displayNo);
    }
    
    public Display getDisplayById(int displayNo) {
        return adminDao.selectDisplayById(sqlSession,displayNo);
    }



    @Transactional
    public void updateDisplay(Display display) {
        adminDao.updateDisplay(sqlSession,display);
    }

    public void updateDisplayStatusToEnd(int displayNo) {
        adminDao.deleteDisplay(sqlSession,displayNo);
    }
    
    
    // 전시관 관리
    public int getGalleryListCount(String searchKeyword) {
        return adminDao.getGalleryListCount(sqlSession, searchKeyword);
    }

    public ArrayList<Gallery> selectGalleryList(PageInfo pi, String searchKeyword) {
        return adminDao.selectGalleryList(sqlSession, pi, searchKeyword);
    }
    
    public Gallery selectGallery(int galleryNo) {
        return adminDao.selectGallery(sqlSession, galleryNo);
    }

    // 대관신청 관리
    public int getRentalListCount(String searchCategory, String searchKeyword) {
        return adminDao.getRentalListCount(sqlSession, searchCategory, searchKeyword);
    }

    // 대관 목록 조회
    public ArrayList<Rental> selectRentalList(PageInfo pi, String searchCategory, String searchKeyword) {
        return adminDao.selectRentalList(sqlSession, pi, searchCategory, searchKeyword);
    }

    // 예매 관리
    public int getReserveListCount(HashMap<String, String> map) {
        return adminDao.getReserveListCount(sqlSession, map);
    }

    public ArrayList<Reserve> selectReserveList(PageInfo pi, HashMap<String, String> map) {
        return adminDao.selectReserveList(sqlSession, pi, map);
    }

    // 공지사항
    public int getNoticeListCount() {
        return adminDao.getNoticeListCount(sqlSession);
    }

    public ArrayList<Notice> selectNoticeList(PageInfo pi) {
        return adminDao.selectNoticeList(sqlSession,pi);
    }

    // 후기
    public int getReviewListCount() {
        return adminDao.getReviewListCount(sqlSession);
    }

    public ArrayList<Review> selectReviewList(PageInfo pi) {
        return adminDao.selectReviewList(sqlSession,pi);
    }

    // 일반 회원
    public int getMemberListCount() {
        return adminDao.getMemberListCount(sqlSession);
    }

    public ArrayList<Member> selectMemberList(PageInfo pi) {
        return adminDao.selectMemberList(sqlSession,pi);
    }

    // 작가
    public int getArtistListCount() {
        return adminDao.getArtistListCount(sqlSession);
    }

    public ArrayList<Artist> selectArtistList(PageInfo pi) {
        return adminDao.selectArtistList(sqlSession,pi);
    }
    
    // 댓글 관리
    public ArrayList<Reply> selectReplyList() {
        return adminDao.selectReplyList(sqlSession);
    }
}
