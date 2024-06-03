package com.kh.curaeasy.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {

    @RequestMapping("admin.do")
    public String mainPage() {
        return "admin/adminPage";
    }
//    @RequestMapping("adminMemberList.do")
//    public String memberList() {
//        return "admin/adminMemberList";
//    }
//    @RequestMapping("adminMemberDetail.do")
//    public String memberDetail() {
//        return "admin/adminMemberDetail";
//    }
//    @RequestMapping("adminNoticeList.do")
//    public String noticeList() {
//        return "admin/adminNoticeList";
//    }
//    @RequestMapping("adminNoticeDetail.do")
//    public String noticeDetail() {
//        return "admin/adminNoticeDetail";
//    }
//    @RequestMapping("adminNoticeWrite.do")
//    public String noticeWrite() {
//        return "admin/adminNoticeWrite";
//    }
//    @RequestMapping("adminNoticeEdit.do")
//    public String noticeEdit() {
//        return "admin/adminNoticeEdit";
//    }
//    @RequestMapping("adminReviewList.do")
//    public String reviewList() {
//        return "admin/adminReviewList";
//    }
//    @RequestMapping("adminReviewDetail.do")
//    public String reviewDetail() {
//        return "admin/adminReviewDetail";
//    }
//    @RequestMapping("adminRentalList.do")
//    public String rentalList() {
//        return "admin/adminRentalList";
//    }
//    @RequestMapping("adminRentalDetail.do")
//    public String rentalDetail() {
//        return "admin/adminRentalDetail";
//    }
//    @RequestMapping("adminArtistList.do")
//    public String artistList() {
//        return "admin/adminArtistList";
//    }
//    @RequestMapping("adminArtistDetail.do")
//    public String artistDetail() {
//        return "admin/adminArtistDetail";
//    }
//    @RequestMapping("adminDisplayList.do")
//    public String displayList() {
//        return "admin/adminDisplayList";
//    }
//    @RequestMapping("adminDisplayDetail.do")
//    public String displayDetail() {
//        return "admin/adminDisplayDetail";
//    }
//    @RequestMapping("adminReserveList.do")
//    public String reserveList() {
//        return "admin/adminReserveList";
//    }
//    @RequestMapping("adminReserveDetail.do")
//    public String reserveDetail() {
//        return "admin/adminReserveDetail";
//    }
}
