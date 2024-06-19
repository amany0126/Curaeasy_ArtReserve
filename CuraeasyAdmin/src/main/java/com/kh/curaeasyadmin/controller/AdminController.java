package com.kh.curaeasyadmin.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.curaeasyadmin.model.service.AdminService;
import com.kh.curaeasyadmin.model.vo.*;

@Controller
public class AdminController {

    @Autowired
    private AdminService adminService;

    @RequestMapping("/")
    public String index(Model model) {
        ArrayList<Display> displayList = adminService.mainPageSelectDisplayList();
        ArrayList<Notice> noticeList = adminService.mainPageSelectNoticeList();
        ArrayList<Review> reviewList = adminService.mainPageSelectReviewList();
        ArrayList<Reply> replyList = adminService.mainPageSelectReplyList();
        ArrayList<Rental> rentalList = adminService.mainPageSelectRentalList();
        ArrayList<Reserve> reserveList = adminService.mainPageSelectReserveList();
        
        model.addAttribute("displayList", displayList);
        model.addAttribute("noticeList", noticeList);
        model.addAttribute("reviewList", reviewList);
        model.addAttribute("replyList", replyList);
        model.addAttribute("rentalList", rentalList);
        model.addAttribute("reserveList", reserveList);
        
        return "index";
    }

    @RequestMapping("displayList.ad")
    public String displayList(Model model) {
        ArrayList<Display> displayList = adminService.selectDisplayList();
        model.addAttribute("displayList", displayList);
        return "display/adminDisplayListView";
    }
    
    @RequestMapping("galleryList.ad")
    public String galleryList(Model model) {
        ArrayList<Gallery> galleryList = adminService.selectGalleryList();
        model.addAttribute("galleryList", galleryList);
        return "gallery/adminGalleryListView";
    }

    @RequestMapping("rentalList.ad")
    public String rentalList(Model model) {
        ArrayList<Rental> rentalList = adminService.selectRentalList();
        model.addAttribute("rentalList", rentalList);
        return "rental/adminRentalListView";
    }

    @RequestMapping("reserveList.ad")
    public String reserveList(Model model) {
        ArrayList<Reserve> reserveList = adminService.selectReserveList();
        model.addAttribute("reserveList", reserveList);
        return "reserve/adminReserveListView";
    }

    @RequestMapping("memberList.ad")
    public String memberList(Model model) {
        ArrayList<Member> memberList = adminService.selectMemberList();
        model.addAttribute("memberList", memberList);
        return "member/adminMemberListView";
    }

    @RequestMapping("artistList.ad")
    public String artistList(Model model) {
        ArrayList<Artist> artistList = adminService.selectArtistList();
        model.addAttribute("artistList", artistList);
        return "artist/adminArtistListView";
    }

    @RequestMapping("noticelist.ad")
    public String noticeList(Model model) {
        ArrayList<Notice> noticeList = adminService.selectNoticeList();
        model.addAttribute("noticeList", noticeList);
        return "notice/adminNoticeListView";
    }

    @RequestMapping("reviewList.ad")
    public String reviewList(Model model) {
        ArrayList<Review> reviewList = adminService.selectReviewList();
        model.addAttribute("reviewList", reviewList);
        return "review/adminReviewListView";
    }
    
    @RequestMapping("replyList.ad")
    public String replyList(Model model) {
        ArrayList<Reply> replyList = adminService.selectReplyList();
        model.addAttribute("replyList", replyList);
        return "reply/adminReplyListView";
    }
}
