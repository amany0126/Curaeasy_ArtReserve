package com.kh.curaeasyadmin.model.dao;

import java.util.ArrayList;

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
    public void deleteDisplay(SqlSessionTemplate sqlSession, int displayNo) {
        sqlSession.delete("adminMapper.deleteDisplay", displayNo);
    }

    // 전시관 관리
    public ArrayList<Gallery> selectGalleryList(SqlSessionTemplate sqlSession) {
        return (ArrayList) sqlSession.selectList("adminMapper.selectGalleryList");
    }

    // 대관신청 관리
    public ArrayList<Rental> selectRentalList(SqlSessionTemplate sqlSession) {
        return (ArrayList) sqlSession.selectList("adminMapper.selectRentalList");
    }

    // 예매 관리
    public ArrayList<Reserve> selectReserveList(SqlSessionTemplate sqlSession) {
        return (ArrayList) sqlSession.selectList("adminMapper.selectReserveList");
    }

    // 회원 관리
    public ArrayList<Member> selectMemberList(SqlSessionTemplate sqlSession) {
        return (ArrayList) sqlSession.selectList("adminMapper.selectMemberList");
    }

    // 작가 관리
    public ArrayList<Artist> selectArtistList(SqlSessionTemplate sqlSession) {
        return (ArrayList) sqlSession.selectList("adminMapper.selectArtistList");
    }

    // 공지사항 관리
    public ArrayList<Notice> selectNoticeList(SqlSessionTemplate sqlSession) {
        return (ArrayList) sqlSession.selectList("adminMapper.selectNoticeList");
    }

    // 후기 관리
    public ArrayList<Review> selectReviewList(SqlSessionTemplate sqlSession) {
        return (ArrayList) sqlSession.selectList("adminMapper.selectReviewList");
    }
    
    // 댓글 관리
    public ArrayList<Reply> selectReplyList(SqlSessionTemplate sqlSession) {
        return (ArrayList) sqlSession.selectList("adminMapper.selectReplyList");
    }
}
