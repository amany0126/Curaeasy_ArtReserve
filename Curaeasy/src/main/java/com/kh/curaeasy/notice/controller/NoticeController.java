package com.kh.curaeasy.notice.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.curaeasy.common.model.vo.PageInfo;
import com.kh.curaeasy.common.template.Pagination;
import com.kh.curaeasy.notice.model.service.NoticeService;
import com.kh.curaeasy.notice.model.vo.Notice;

@Controller
public class NoticeController {
	
	@Autowired
	private NoticeService noticeService;
	
	
	@RequestMapping("notice.do")
	public String noticeList() {
		return "notice/noticeListView";
	}
	@RequestMapping("noticeDetail.do")
	public String noticeDetail() {
		return "notice/noticeDetailView";
	}

	// 1번페이징처리
	@GetMapping("notice.do")
	public String selectList(
			@RequestParam(value="cpage", defaultValue="1") int currentPage, Model model) {

		int listCount = noticeService.selectListCount();
		
		int pageLimit = 10;
		int boardLimit = 5;
		
		PageInfo pi 
			= Pagination.getPageInfo(listCount, 
								 	 currentPage, 
								 	 pageLimit, 
								 	 boardLimit);
		ArrayList<Notice> list 
					= noticeService.selectList(pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		return "notice/noticeListView";
	}
	

	@GetMapping("noticeDetail.do")
	public ModelAndView selectNotice(@RequestParam("nno") int nno, ModelAndView mv, Model model) {
	    try {
	        int result = noticeService.increaseCount(nno);

	        System.out.println("공지 번호: " + nno);
	        System.out.println("조회수 증가 결과: " + result);

	        if(result > 0) {
	        	
	            Notice n = noticeService.selectNotice(nno);

	            System.out.println("공지 제목: " + n.getNoticeTitle());

	            // 이전글과 다음글 ID 조회
	            Integer previousNoticeId = noticeService.getPreviousNoticeId(nno);
	            Integer nextNoticeId = noticeService.getNextNoticeId(nno);

	            // 조회된 값 설정
	            if (previousNoticeId != null) {
	                mv.addObject("previousNoticeId", previousNoticeId);
	            }
	            if (nextNoticeId != null) {
	                mv.addObject("nextNoticeId", nextNoticeId);
	            }

	            mv.addObject("n", n).setViewName("notice/noticeDetailView");
	        } else {
	            mv.addObject("errorMsg", "게시글 상세조회 실패")
	              .setViewName("common/errorPage");
	        }
	    } catch (Exception e) {
	        mv.addObject("errorMsg", "게시글 상세조회 중 오류 발생")
	          .setViewName("common/errorPage");
	        e.printStackTrace();
	    }
	    return mv;
	}
	
    /*
    Notice notice = noticeService.getNoticeById(noticeId);
    model.addAttribute("notice", notice);

    // 다음글과 이전글 ID를 모델에 추가
    int previousNoticeId = noticeService.getPreviousNoticeId(noticeNo);
    int nextNoticeId = noticeService.getNextNoticeId(noticeNo);
    model.addAttribute("previousNoticeId", previousNoticeNo);
    model.addAttribute("nextNoticeId", nextNoticeNo);
    */
	
	/*
	@GetMapping("noticeDetail.do")
	public ModelAndView selectNotice(int nno,
									ModelAndView mv) {
		
		int result = noticeService.increaseCount(nno);
		
		System.out.println(nno);
		
		if(result > 0) {
			
			
			Notice n = noticeService.selectNotice(nno);
			mv.addObject("n", n).setViewName("notice/noticeDetailView");

			
		} else {
			mv.addObject("errorMsg", "게시글 상세조회 실패")
			  .setViewName("common/errorPage");
		}
		return mv;
	}*/
	
	
	
}
