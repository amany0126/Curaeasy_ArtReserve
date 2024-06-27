package com.kh.curaeasyadmin.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.kh.curaeasyadmin.common.model.vo.PageInfo;
import com.kh.curaeasyadmin.model.vo.*;

@Repository
public class AdminDao {
	
	// 대시보드 관련
	
    public int getMemberCount(SqlSessionTemplate sqlSession) {
        return sqlSession.selectOne("adminMapper.getMemberCount");
    }

    public int getCurrentYearSales(SqlSessionTemplate sqlSession) {
        return sqlSession.selectOne("adminMapper.getCurrentYearSales");
    }

    public int getExhibitionCount(SqlSessionTemplate sqlSession) {
        return sqlSession.selectOne("adminMapper.getDisplayCount");
    }

    public int getArtistsAwaitingApproval(SqlSessionTemplate sqlSession) {
    	return sqlSession.selectOne("adminMapper.getArtistsAwaitingApproval");
    
    }
    
    public ArrayList<Map<String, Object>> getTop5Displays(SqlSessionTemplate sqlSession) {
        return (ArrayList) sqlSession.selectList("adminMapper.getTop5Displays");
    }


    public List<Map<String, Object>> getMonthlyReservationCounts(SqlSessionTemplate sqlSession) {
        return sqlSession.selectList("adminMapper.getMonthlyReservationCounts");
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

    public Display selectDisplayById(SqlSessionTemplate sqlSession, int displayNo) {
        return sqlSession.selectOne("adminMapper.selectDisplayById", displayNo);
    }
    
    public ArrayList<DisplayAttachment> selectAttachmentsByDisplayNo(SqlSessionTemplate sqlSession, int displayNo) {
        return (ArrayList)sqlSession.selectList("adminMapper.selectAttachmentsByDisplayNo", displayNo);
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


	public int addDisplayAttachment(SqlSessionTemplate sqlSession,  DisplayAttachment uplodeAttachment) {
		 return sqlSession.insert("adminMapper.addDisplayAttachment", uplodeAttachment);
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
    
    public int artistOngoing(SqlSessionTemplate sqlSession, int artistNo, String status) {
        Map<String, Object> params = new HashMap<>();
        params.put("artistNo", artistNo);
        params.put("artistStatus", status);
        return sqlSession.update("adminMapper.updateMemberArtistOngoing", params);
    }
   
    
    
    public int updateArtist(SqlSessionTemplate sqlSession, Artist artist) {
        return sqlSession.update("adminMapper.updateArtist", artist);
        
    }

    public Artist selectArtist(SqlSessionTemplate sqlSession, Integer artistNo) {
        return sqlSession.selectOne("adminMapper.selectArtist", artistNo);
    }
  
    // 댓글 관리
    public ArrayList<Reply> selectReplyList(SqlSessionTemplate sqlSession) {
        return (ArrayList)sqlSession.selectList("adminMapper.selectReplyList");
    }

	public int displayUpdate(SqlSessionTemplate sqlSession, Display display) {
		return sqlSession.update("adminMapper.displayUpdate", display);
	}

	public int displayAttUpdate(SqlSessionTemplate sqlSession, DisplayAttachment attachments) {
		return sqlSession.update("adminMapper.displayAttUpdate", attachments);
	}

	public DisplayAttachment selectAttachment1(SqlSessionTemplate sqlSession, int displayNo) {
		return sqlSession.selectOne("adminMapper.selectAttachment1", displayNo);
	}
	public DisplayAttachment selectAttachment2(SqlSessionTemplate sqlSession, int displayNo) {
		return sqlSession.selectOne("adminMapper.selectAttachment2", displayNo);
	}

	public int updateDisplayDate(SqlSessionTemplate sqlSession, Display display) {
		return sqlSession.update("adminMapper.updateDisplayDate", display);
	}

	public int updateAttachment(SqlSessionTemplate sqlSession, DisplayAttachment reAttachment) {
		return sqlSession.update("adminMapper.updateAttachment", reAttachment);
	}

	public Notice selectNoticeDetail(SqlSessionTemplate sqlSession, int noticeNo) {
		return sqlSession.selectOne("adminMapper.selectNoticeDetail", noticeNo);
	}

	public int noticeUpdate(SqlSessionTemplate sqlSession, Notice notice) {
		return sqlSession.update("adminMapper.noticeUpdate", notice);
	}

	public int insertNotice(SqlSessionTemplate sqlSession, Notice notice) {
		return sqlSession.insert("adminMapper.insertNotice", notice);
	}


}
