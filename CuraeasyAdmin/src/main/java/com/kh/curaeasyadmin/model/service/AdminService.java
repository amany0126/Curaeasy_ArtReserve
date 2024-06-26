package com.kh.curaeasyadmin.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
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
    
    // 대시보드 관련
    
    public int getMemberCount() {
        return adminDao.getMemberCount(sqlSession);
    }

    public int getCurrentYearSales() {
        return adminDao.getCurrentYearSales(sqlSession);
    }

    public int getExhibitionCount() {
        return adminDao.getExhibitionCount(sqlSession);
    }

    public int getArtistsAwaitingApproval() {
        return adminDao.getArtistsAwaitingApproval(sqlSession);
    }
    
    public List<Map<String, Object>> getTop5Displays() {
        return adminDao.getTop5Displays(sqlSession);
    }

    public List<Map<String, Object>> getMonthlyReservationCounts() {
        return adminDao.getMonthlyReservationCounts(sqlSession);
    }

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

    public ArrayList<DisplayAttachment> selectAttachmentsByDisplayNo(int displayNo) {
        return adminDao.selectAttachmentsByDisplayNo(sqlSession, displayNo);
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

    // 회원 관리
    public int getMemberListCount() {
        return adminDao.getMemberListCount(sqlSession);
    }

    public ArrayList<Member> selectMemberList(PageInfo pi) {
        return adminDao.selectMemberList(sqlSession, pi);
    }

    public Member getMemberById(int memberNo) {
        return adminDao.getMemberById(sqlSession, memberNo);
    }

    public int updateMember(Member member) {
        return adminDao.updateMember(sqlSession, member);
    }

    public int updateMemberStatus(int memberNo) {
        return adminDao.updateMemberStatus(sqlSession, memberNo);
    }



    // 작가 관리
    public int getArtistListCount() {
        return adminDao.getArtistListCount(sqlSession);
    }

    public ArrayList<Artist> selectArtistList(PageInfo pi) {
        return adminDao.selectArtistList(sqlSession, pi);
    }
    
    @Transactional
    public boolean updateArtist(Artist artist) {
        return adminDao.updateArtist(sqlSession,artist) > 0;
    }

    public Artist selectArtist(Integer artistNo) {
        return adminDao.selectArtist(sqlSession,artistNo);
    }
    @Transactional
    public void approveArtist(int artistNo) {
        adminDao.updateArtistStatus(sqlSession, artistNo, "Y", "Y");
    }
    
    @Transactional
    public void artistOngoing(int artistNo) {
        adminDao.artistOngoing(sqlSession, artistNo, "Y");
    }
    
    

    @Transactional
    public void rejectArtist(int artistNo) {
        adminDao.updateArtistStatus(sqlSession, artistNo, "Y", "N");
    }
    
    // 댓글 관리
    public ArrayList<Reply> selectReplyList() {
        return adminDao.selectReplyList(sqlSession);
    }
    
    @Transactional
	public int updateDisplay(Display display, DisplayAttachment attachments) {
		return adminDao.displayUpdate(sqlSession,display)*adminDao.displayAttUpdate(sqlSession,attachments);
	}

	public DisplayAttachment selectAttachments(int displayNo) {
		 return adminDao.selectAttachments(sqlSession,displayNo);
	}
}
