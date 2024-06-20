package com.kh.curaeasyadmin.model.service;

import java.util.ArrayList;

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
    
    public int getDisplayListCount() {
        return adminDao.getDisplayListCount(sqlSession);
    }

    public ArrayList<Display> selectDisplayList(PageInfo pi) {
        return adminDao.selectDisplayList(sqlSession, pi);
    }
    
    public Display selectDisplay(int displayNo) {
        return adminDao.selectDisplay(sqlSession, displayNo);
    }
    
    public void deleteDisplay(int displayNo) {
        adminDao.deleteDisplay(sqlSession, displayNo);
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
