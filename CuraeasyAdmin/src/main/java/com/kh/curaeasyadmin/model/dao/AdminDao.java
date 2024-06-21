package com.kh.curaeasyadmin.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.curaeasyadmin.common.model.vo.PageInfo;
import com.kh.curaeasyadmin.model.vo.*;

@Repository
public class AdminDao {

    // 메인 페이지

    public int getDisplayListCount(SqlSessionTemplate sqlSession) {
        return sqlSession.selectOne("adminMapper.getDisplayListCount");
    }
	
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

    

    public Display selectDisplayById(SqlSessionTemplate sqlSession,int displayNo) {
        return sqlSession.selectOne("adminMapper.selectDisplayById", displayNo);
    }

    public int updateDisplay(SqlSessionTemplate sqlSession,Display display) {
        return sqlSession.update("adminMapper.updateDisplay", display);
    }

    public void deleteDisplay(SqlSessionTemplate sqlSession,int displayNo) {
        sqlSession.update("adminMapper.deleteDisplay", displayNo);
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

    // 대관신청 관리
    public int getRentalListCount(SqlSessionTemplate sqlSession, String searchCategory, String searchKeyword) {
        HashMap<String, String> paramMap = new HashMap<>();
        paramMap.put("searchCategory", searchCategory);
        paramMap.put("searchKeyword", searchKeyword);
        return sqlSession.selectOne("adminMapper.getRentalListCount", paramMap);
    }
    public ArrayList<Rental> selectRentalList(SqlSessionTemplate sqlSession, PageInfo pi, String searchCategory, String searchKeyword) {
        int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
        RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
        HashMap<String, String> paramMap = new HashMap<>();
        paramMap.put("searchCategory", searchCategory);
        paramMap.put("searchKeyword", searchKeyword);
        return (ArrayList)sqlSession.selectList("adminMapper.selectRentalList", paramMap, rowBounds);
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

    // 공지사항
    public int getNoticeListCount(SqlSessionTemplate sqlSession) {
        return sqlSession.selectOne("adminMapper.getNoticeListCount");
    }

    public ArrayList<Notice> selectNoticeList(SqlSessionTemplate sqlSession,PageInfo pi) {
        int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
        RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
        return (ArrayList) sqlSession.selectList("adminMapper.selectNoticeList", null, rowBounds);
    }

    // 후기
    public int getReviewListCount(SqlSessionTemplate sqlSession) {
        return sqlSession.selectOne("adminMapper.getReviewListCount");
    }

    public ArrayList<Review> selectReviewList(SqlSessionTemplate sqlSession,PageInfo pi) {
        int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
        RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
        return (ArrayList) sqlSession.selectList("adminMapper.selectReviewList", null, rowBounds);
    }

    // 일반 회원
    public int getMemberListCount(SqlSessionTemplate sqlSession) {
        return sqlSession.selectOne("adminMapper.getMemberListCount");
    }

    public ArrayList<Member> selectMemberList(SqlSessionTemplate sqlSession,PageInfo pi) {
        int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
        RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
        return (ArrayList) sqlSession.selectList("adminMapper.selectMemberList", null, rowBounds);
    }

    // 작가
    public int getArtistListCount(SqlSessionTemplate sqlSession) {
        return sqlSession.selectOne("adminMapper.getArtistListCount");
    }

    public ArrayList<Artist> selectArtistList(SqlSessionTemplate sqlSession,PageInfo pi) {
        int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
        RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
        return (ArrayList) sqlSession.selectList("adminMapper.selectArtistList", null, rowBounds);
    }
    
    // 댓글 관리
    public ArrayList<Reply> selectReplyList(SqlSessionTemplate sqlSession) {
        return (ArrayList) sqlSession.selectList("adminMapper.selectReplyList");
    }
}
