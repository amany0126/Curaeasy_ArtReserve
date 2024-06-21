package com.kh.curaeasyadmin.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.curaeasyadmin.common.model.vo.PageInfo;
import com.kh.curaeasyadmin.common.template.Pagination;
import com.kh.curaeasyadmin.model.service.AdminService;
import com.kh.curaeasyadmin.model.vo.*;

@Controller
public class AdminController {

    @Autowired
    private AdminService adminService;

    @RequestMapping("/admin.ad")
    public String index(Model model) {
//        int countMember = adminService.getCountMember();
//        int yearSales = adminService.getYearSales();
//        int countDisplay = adminService.getCountDisplay();
//        int pendingArtists = adminService.getPendingArtists();
//
//        model.addAttribute("countMember", countMember);
//        model.addAttribute("yearSales", yearSales);
//        model.addAttribute("countDisplay", countDisplay);
//        model.addAttribute("pendingArtists", pendingArtists);

        return "adminmain";
    }

    // 전시회 관리
    @RequestMapping("displayList.ad")
    public String displayList(@RequestParam(value="currentPage", defaultValue="1") int currentPage,
                              @RequestParam(value="searchKeyword", defaultValue="") String searchKeyword,
                              Model model) {
        int listCount = adminService.getDisplayListCount(searchKeyword);

        int pageLimit = 10;
        int boardLimit = 10;

        PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
        ArrayList<Display> displayList = adminService.selectDisplayList(pi, searchKeyword);

        model.addAttribute("displayList", displayList);
        model.addAttribute("pi", pi);
        model.addAttribute("searchKeyword", searchKeyword);

        return "display/adminDisplayListView";
    }

    @RequestMapping("displayDetail.ad")
    public String displayDetail(@RequestParam("displayNo") int displayNo, Model model) {
        Display display = adminService.selectDisplay(displayNo);
        model.addAttribute("display", display);

        return "display/adminDisplayDetailView";
    }

    @RequestMapping("updateDisplayForm.ad")
    public String updateDisplayForm(@RequestParam("displayNo") int displayNo, Model model) {
        Display display = adminService.selectDisplay(displayNo);
        model.addAttribute("display", display);
        return "display/adminDisplayUpdateForm";
    }

    @RequestMapping("deleteDisplay.ad")
    public String deleteDisplay(@RequestParam("displayNo") int displayNo) {
        adminService.deleteDisplay(displayNo);
        return "redirect:displayList.ad";
    }

    // 전시관 목록 조회
    @RequestMapping("galleryList.ad")
    public String galleryList(@RequestParam(value="currentPage", defaultValue="1") int currentPage, 
                              @RequestParam(value="searchKeyword", defaultValue="") String searchKeyword, 
                              Model model) {
        int listCount = adminService.getGalleryListCount(searchKeyword); // 전시관 리스트 총 개수

        int pageLimit = 10; // 페이지 하단에 보여질 페이지 최대 개수
        int boardLimit = 10; // 한 페이지에 보여질 게시글 최대 개수

        PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
        ArrayList<Gallery> galleryList = adminService.selectGalleryList(pi, searchKeyword);

        model.addAttribute("galleryList", galleryList);
        model.addAttribute("pi", pi);

        return "gallery/adminGalleryListView";
    }
    
    @RequestMapping("galleryDetail.ad")
    public String galleryDetail(@RequestParam("galleryNo") int galleryNo, Model model) {
        Gallery gallery = adminService.selectGallery(galleryNo);
        model.addAttribute("gallery", gallery);

        return "gallery/adminGalleryDetailView";
    }

    // 대관신청 관리
    @RequestMapping("rentalList.ad")
    public String rentalList(@RequestParam(value="currentPage", defaultValue="1") int currentPage,
                             @RequestParam(value="searchCategory", required=false) String searchCategory,
                             @RequestParam(value="searchKeyword", required=false) String searchKeyword,
                             Model model) {
        int listCount = adminService.getRentalListCount(searchCategory, searchKeyword); // 대관 리스트 총 개수
        int pageLimit = 10; // 페이지 하단에 보여질 페이지 최대 개수
        int boardLimit = 10; // 한 페이지에 보여질 게시글 최대 개수

        PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
        ArrayList<Rental> rentalList = adminService.selectRentalList(pi, searchCategory, searchKeyword);

        model.addAttribute("rentalList", rentalList);
        model.addAttribute("pi", pi);
        model.addAttribute("searchCategory", searchCategory);
        model.addAttribute("searchKeyword", searchKeyword);

        return "rental/adminRentalListView";
    }

    // 예매 관리
    @RequestMapping("reserveList.ad")
    public String reserveList(@RequestParam(value="currentPage", defaultValue="1") int currentPage,
                              @RequestParam(value="searchCategory", required=false) String searchCategory,
                              @RequestParam(value="searchValue", required=false) String searchValue,
                              Model model) {

        HashMap<String, String> map = new HashMap<>();
        map.put("searchCategory", searchCategory);
        map.put("searchValue", searchValue);

        int listCount = adminService.getReserveListCount(map); // 예매 리스트 총 개수

        int pageLimit = 10; // 페이지 하단에 보여질 페이지 최대 개수
        int boardLimit = 10; // 한 페이지에 보여질 게시글 최대 개수

        PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
        ArrayList<Reserve> reserveList = adminService.selectReserveList(pi, map);

        model.addAttribute("reserveList", reserveList);
        model.addAttribute("pi", pi);

        return "reserve/adminReserveListView";
    }

 // 공지사항 목록 조회
    @RequestMapping("noticeList.ad")
    public String noticeList(@RequestParam(value="currentPage", defaultValue="1") int currentPage, Model model) {
        int listCount = adminService.getNoticeListCount();
        PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
        ArrayList<Notice> noticeList = adminService.selectNoticeList(pi);
        model.addAttribute("noticeList", noticeList);
        model.addAttribute("pi", pi);
        return "notice/adminNoticeListView";
    }

    // 후기 목록 조회
    @RequestMapping("reviewList.ad")
    public String reviewList(@RequestParam(value="currentPage", defaultValue="1") int currentPage, Model model) {
        int listCount = adminService.getReviewListCount();
        PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
        ArrayList<Review> reviewList = adminService.selectReviewList(pi);
        model.addAttribute("reviewList", reviewList);
        model.addAttribute("pi", pi);
        return "review/adminReviewListView";
    }

    // 일반 회원 목록 조회
    @RequestMapping("memberList.ad")
    public String memberList(@RequestParam(value="currentPage", defaultValue="1") int currentPage, Model model) {
        int listCount = adminService.getMemberListCount();
        PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
        ArrayList<Member> memberList = adminService.selectMemberList(pi);
        model.addAttribute("memberList", memberList);
        model.addAttribute("pi", pi);

        return "member/adminMemberListView";
    }

    // 작가 목록 조회
    @RequestMapping("artistList.ad")
    public String artistList(@RequestParam(value="currentPage", defaultValue="1") int currentPage, Model model) {
        int listCount = adminService.getArtistListCount();
        PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
        ArrayList<Artist> artistList = adminService.selectArtistList(pi);
        model.addAttribute("artistList", artistList);
        model.addAttribute("pi", pi);
        return "artist/adminArtistListView";
    }

    // 댓글 관리
    @RequestMapping("replyList.ad")
    public String replyList(Model model) {
        ArrayList<Reply> replyList = adminService.selectReplyList();
        model.addAttribute("replyList", replyList);
        return "reply/adminReplyListView";
    }
}
