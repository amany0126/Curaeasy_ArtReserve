package com.kh.curaeasyadmin.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.curaeasyadmin.common.model.vo.PageInfo;
import com.kh.curaeasyadmin.model.vo.*;

@Repository
public class AdminDao {

    // 전시회 관리
    public int getDisplayListCount(SqlSessionTemplate sqlSession, String searchKeyword) {
        return sqlSession.selectOne("adminMapper.getDisplayListCount", searchKeyword);
    }

    public ArrayList<Display> selectDisplayList(SqlSessionTemplate sqlSession, PageInfo pi, String searchKeyword) {
        int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
        RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
        return (ArrayList)sqlSession.selectList("adminMapper.selectDisplayList", searchKeyword, rowBounds);
    }
    
    public Display selectDisplay(SqlSessionTemplate sqlSession, int displayNo) {
        return sqlSession.selectOne("adminMapper.selectDisplay", displayNo);
    }

    public Display selectDisplayById(SqlSessionTemplate sqlSession, int displayNo) {
        return sqlSession.selectOne("adminMapper.selectDisplayById", displayNo);
    }

    public int updateDisplay(SqlSessionTemplate sqlSession, Display display) {
        return sqlSession.update("adminMapper.updateDisplay", display);
    }

    public void deleteDisplay(SqlSessionTemplate sqlSession, int displayNo) {
        sqlSession.update("adminMapper.deleteDisplay", displayNo);
    }
    
    public int addDisplay(SqlSessionTemplate sqlSession, Display display) {
        return sqlSession.insert("adminMapper.addDisplay", display);
    }

    public int addDisplayAttachment(SqlSessionTemplate sqlSession, DisplayAttachment attachment) {
        return sqlSession.insert("adminMapper.addDisplayAttachment", attachment);
    }

    // 전시관 관리
    public int getGalleryListCount(SqlSessionTemplate sqlSession, String searchKeyword) {
        return sqlSession.selectOne("adminMapper.getGalleryListCount", searchKeyword);
    }

    public ArrayList<Gallery> selectGalleryList(SqlSessionTemplate sqlSession, PageInfo pi, String searchKeyword) {
        int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
        RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
        
        HashMap<String, Object> paramMap = new HashMap<>();
        paramMap.put("searchKeyword", searchKeyword);

        return (ArrayList)sqlSession.selectList("adminMapper.selectGalleryList", paramMap, rowBounds);
    }

    public Gallery selectGallery(SqlSessionTemplate sqlSession, int galleryNo) {
        return sqlSession.selectOne("adminMapper.selectGallery", galleryNo);
    }

    public int updateGallery(SqlSessionTemplate sqlSession, Gallery gallery) {
        return sqlSession.update("adminMapper.updateGallery", gallery);
    }

    public void deleteGallery(SqlSessionTemplate sqlSession, int galleryNo) {
        sqlSession.update("adminMapper.deleteGallery", galleryNo);
    }
    
    public int addGallery(SqlSessionTemplate sqlSession, Gallery gallery) {
        return sqlSession.insert("adminMapper.addGallery", gallery);
    }

    // 대관신청 관리
    public int getRentalListCount(SqlSessionTemplate sqlSession, Map<String, String> params) {
        return sqlSession.selectOne("adminMapper.getRentalListCount", params);
    }

    public ArrayList<Rental> selectRentalList(SqlSessionTemplate sqlSession, PageInfo pi, Map<String, String> params) {
        int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
        RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
        return (ArrayList) sqlSession.selectList("adminMapper.selectRentalList", params, rowBounds);
    }
    
    public Rental selectRentalByNo(SqlSessionTemplate sqlSession, int rentalNo) {
        return sqlSession.selectOne("adminMapper.selectRentalByNo", rentalNo);
    }

    public int updateRentalStatus(SqlSessionTemplate sqlSession, int rentalNo) {
        return sqlSession.update("adminMapper.updateRentalStatus", rentalNo);
    }

    public int updateRental(SqlSessionTemplate sqlSession, Rental rental) {
        return sqlSession.update("adminMapper.updateRental", rental);
    }

    // 예매 관리
    public int getReserveListCount(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
        return sqlSession.selectOne("adminMapper.getReserveListCount", map);
    }

    public ArrayList<Reserve> selectReserveList(SqlSessionTemplate sqlSession, PageInfo pi, HashMap<String, String> map) {
        int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
        RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
        return (ArrayList)sqlSession.selectList("adminMapper.selectReserveList", map, rowBounds);
    }

    // 공지사항 관리
    public int getNoticeListCount(SqlSessionTemplate sqlSession) {
        return sqlSession.selectOne("adminMapper.getNoticeListCount");
    }

    public ArrayList<Notice> selectNoticeList(SqlSessionTemplate sqlSession, PageInfo pi) {
        int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
        RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
        return (ArrayList)sqlSession.selectList("adminMapper.selectNoticeList", null, rowBounds);
    }

    // 후기 관리
    public int getReviewListCount(SqlSessionTemplate sqlSession) {
        return sqlSession.selectOne("adminMapper.getReviewListCount");
    }

    public ArrayList<Review> selectReviewList(SqlSessionTemplate sqlSession, PageInfo pi) {
        int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
        RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
        return (ArrayList)sqlSession.selectList("adminMapper.selectReviewList", null, rowBounds);
    }

    // 회원 관리
    public int getMemberListCount(SqlSessionTemplate sqlSession) {
        return sqlSession.selectOne("adminMapper.getMemberListCount");
    }

    public ArrayList<Member> selectMemberList(SqlSessionTemplate sqlSession, PageInfo pi) {
        int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
        RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
        return (ArrayList)sqlSession.selectList("adminMapper.selectMemberList", null, rowBounds);
    }

    public Member getMemberById(SqlSessionTemplate sqlSession, int memberNo) {
        return sqlSession.selectOne("adminMapper.getMemberById", memberNo);
    }

    public int updateMember(SqlSessionTemplate sqlSession, Member member) {
        return sqlSession.update("adminMapper.updateMember", member);
    }

    public int updateMemberStatus(SqlSessionTemplate sqlSession, int memberNo) {
        return sqlSession.update("adminMapper.updateMemberStatus", memberNo);
    }

    // 작가 관리
    public int getArtistListCount(SqlSessionTemplate sqlSession) {
        return sqlSession.selectOne("adminMapper.getArtistListCount");
    }

    public ArrayList<Artist> selectArtistList(SqlSessionTemplate sqlSession, PageInfo pi) {
        int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
        RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
        return (ArrayList)sqlSession.selectList("adminMapper.selectArtistList", null, rowBounds);
    }
    
    public int updateArtistStatus(SqlSessionTemplate sqlSession, int artistNo, String result, String status) {
        Map<String, Object> params = new HashMap<>();
        params.put("artistNo", artistNo);
        params.put("artistResult", result);
        params.put("artistStatus", status);
        return sqlSession.update("adminMapper.updateArtistStatus", params);
    }
    
    public void updateArtist(SqlSessionTemplate sqlSession, Artist artist) {
        sqlSession.update("adminMapper.updateArtist", artist);
    }
    
    // 댓글 관리
    public ArrayList<Reply> selectReplyList(SqlSessionTemplate sqlSession) {
        return (ArrayList)sqlSession.selectList("adminMapper.selectReplyList");
    }
}
