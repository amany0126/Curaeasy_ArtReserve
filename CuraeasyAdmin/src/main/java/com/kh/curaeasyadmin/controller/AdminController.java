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

    // 전시관 관리
    @RequestMapping("galleryList.ad")
    public String galleryList(Model model) {
        ArrayList<Gallery> galleryList = adminService.selectGalleryList();
        model.addAttribute("galleryList", galleryList);
        return "gallery/adminGalleryListView";
    }

    // 대관신청 관리
    @RequestMapping("rentalList.ad")
    public String rentalList(Model model) {
        ArrayList<Rental> rentalList = adminService.selectRentalList();
        model.addAttribute("rentalList", rentalList);
        return "rental/adminRentalListView";
    }

    // 예매 관리
    @RequestMapping("reserveList.ad")
    public String reserveList(Model model) {
        ArrayList<Reserve> reserveList = adminService.selectReserveList();
        model.addAttribute("reserveList", reserveList);
        return "reserve/adminReserveListView";
    }

    // 회원 관리
    @RequestMapping("memberList.ad")
    public String memberList(Model model) {
        ArrayList<Member> memberList = adminService.selectMemberList();
        model.addAttribute("memberList", memberList);
        return "member/adminMemberListView";
    }

    // 작가 관리
    @RequestMapping("artistList.ad")
    public String artistList(Model model) {
        ArrayList<Artist> artistList = adminService.selectArtistList();
        model.addAttribute("artistList", artistList);
        return "artist/adminArtistListView";
    }

    // 공지사항 관리
    @RequestMapping("noticeList.ad")
    public String noticeList(Model model) {
        ArrayList<Notice> noticeList = adminService.selectNoticeList();
        model.addAttribute("noticeList", noticeList);
        return "notice/adminNoticeListView";
    }

    // 후기 관리
    @RequestMapping("reviewList.ad")
    public String reviewList(Model model) {
        ArrayList<Review> reviewList = adminService.selectReviewList();
        model.addAttribute("reviewList", reviewList);
        return "review/adminReviewListView";
    }

    // 댓글 관리
    @RequestMapping("replyList.ad")
    public String replyList(Model model) {
        ArrayList<Reply> replyList = adminService.selectReplyList();
        model.addAttribute("replyList", replyList);
        return "reply/adminReplyListView";
    }
}
