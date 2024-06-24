package com.kh.curaeasyadmin.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
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

    // 전시회 관리
    public int getDisplayListCount(String searchKeyword) {
        return adminDao.getDisplayListCount(sqlSession, searchKeyword);
    }

    public ArrayList<Display> selectDisplayList(PageInfo pi, String searchKeyword) {
        return adminDao.selectDisplayList(sqlSession, pi, searchKeyword);
    }
    
    public Display selectDisplay(int displayNo) {
        return adminDao.selectDisplay(sqlSession, displayNo);
    }
    
    public Display getDisplayById(int displayNo) {
        return adminDao.selectDisplayById(sqlSession, displayNo);
    }

    @Transactional
    public void updateDisplay(Display display) {
        adminDao.updateDisplay(sqlSession, display);
    }

    public void updateDisplayStatusToEnd(int displayNo) {
        adminDao.deleteDisplay(sqlSession, displayNo);
    }
    
    @Transactional
    public void addDisplay(Display display, ArrayList<DisplayAttachment> attachmentList) {
        adminDao.addDisplay(sqlSession, display);
        if (attachmentList != null && !attachmentList.isEmpty()) {
            for (DisplayAttachment attachment : attachmentList) {
                attachment.setDisplayNo(display.getDisplayNo());
                adminDao.addDisplayAttachment(sqlSession, attachment);
            }
        }
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

    @Transactional
    public void updateGallery(Gallery gallery) {
        adminDao.updateGallery(sqlSession, gallery);
    }

    @Transactional
    public void deleteGallery(int galleryNo) {
        adminDao.deleteGallery(sqlSession, galleryNo);
    }
    
    public void addGallery(Gallery gallery) {
        adminDao.addGallery(sqlSession, gallery);
    }
    
    // 대관신청 관리
    
    public int getRentalListCount(String searchCategory, String searchKeyword) {
        Map<String, String> params = new HashMap<>();
        params.put("searchCategory", searchCategory);
        params.put("searchKeyword", searchKeyword);
        return adminDao.getRentalListCount(sqlSession, params);
    }

    public ArrayList<Rental> selectRentalList(PageInfo pi, String searchCategory, String searchKeyword) {
        Map<String, String> params = new HashMap<>();
        params.put("searchCategory", searchCategory);
        params.put("searchKeyword", searchKeyword);
        return adminDao.selectRentalList(sqlSession, pi, params);
    }
    
    public Rental getRentalByNo(int rentalNo) {
        return adminDao.selectRentalByNo(sqlSession, rentalNo);
    }

    @Transactional
    public boolean updateRentalStatus(int rentalNo) {
        int result = adminDao.updateRentalStatus(sqlSession, rentalNo);
        return result > 0;
    }

    @Transactional
    public void updateRental(Rental rental) {
        adminDao.updateRental(sqlSession, rental);
    }

    // 예매 관리
    public int getReserveListCount(HashMap<String, String> map) {
        return adminDao.getReserveListCount(sqlSession, map);
    }

    public ArrayList<Reserve> selectReserveList(PageInfo pi, HashMap<String, String> map) {
        return adminDao.selectReserveList(sqlSession, pi, map);
    }

    // 공지사항 관리
    public int getNoticeListCount() {
        return adminDao.getNoticeListCount(sqlSession);
    }

    public ArrayList<Notice> selectNoticeList(PageInfo pi) {
        return adminDao.selectNoticeList(sqlSession, pi);
    }

    // 후기 관리
    public int getReviewListCount() {
        return adminDao.getReviewListCount(sqlSession);
    }

    public ArrayList<Review> selectReviewList(PageInfo pi) {
        return adminDao.selectReviewList(sqlSession, pi);
    }

    // 일반회원 관리
    public int getMemberListCount() {
        return adminDao.getMemberListCount(sqlSession);
    }

    public ArrayList<Member> selectMemberList(PageInfo pi) {
        return adminDao.selectMemberList(sqlSession, pi);
    }

    public Member getMemberById(int memberNo) {
        return adminDao.selectMemberById(sqlSession, memberNo);
    }

    @Transactional
    public void updateMember(Member member) {
        adminDao.updateMember(sqlSession, member);
    }

    @Transactional
    public void updateMemberStatus(int memberNo) {
        adminDao.updateMemberStatus(sqlSession, memberNo);
    }

    // 작가 관리
    public int getArtistListCount() {
        return adminDao.getArtistListCount(sqlSession);
    }

    public ArrayList<Artist> selectArtistList(PageInfo pi) {
        return adminDao.selectArtistList(sqlSession, pi);
    }
    
    // 댓글 관리
    public ArrayList<Reply> selectReplyList() {
        return adminDao.selectReplyList(sqlSession);
    }
}
