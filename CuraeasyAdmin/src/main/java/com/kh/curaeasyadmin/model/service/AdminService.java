package com.kh.curaeasyadmin.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
        return adminDao.selectDisplay(sqlSession, displayNo);
    }
    
    public void deleteDisplay(int displayNo) {
        adminDao.deleteDisplay(sqlSession, displayNo);
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
