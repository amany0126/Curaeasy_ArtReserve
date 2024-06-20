package com.kh.curaeasy.review.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.curaeasy.common.model.vo.PageInfo;
import com.kh.curaeasy.common.template.Pagination;
import com.kh.curaeasy.member.model.vo.Member;
import com.kh.curaeasy.review.model.service.ReviewService;
import com.kh.curaeasy.review.model.vo.Review;

@Controller
public class ReviewController {
	@Autowired private ReviewService reviewService;
	
	@GetMapping(value = "review.do", produces = "text/html; charset=UTF-8")
	public String reviewList(@RequestParam(value ="cpage",defaultValue = "1") int currentPage, Model model, HttpSession session, 
			@RequestParam(value ="category",defaultValue = "")  String category, @RequestParam(value ="search",defaultValue = "")  String search ) {
		
		
		int userNo=0;
		
		if( ((Member)session.getAttribute("loginUser")) != null) {
			userNo = ((Member)session.getAttribute("loginUser")).getMemberNo();
		}
		int ticket=  reviewService.ticket(userNo);
		
		
		ArrayList<Review> list = null;
		PageInfo pi  = null;
		if(category.equals("")) {
			int listCount = reviewService.selectListAllCount(search);
			// System.out.println(listCount);
			int pageLimit = 10;
			int boardLimit = 5;
			// PageInfo 객체 만들어 내기
			 pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
			 list = reviewService.selectAllList(pi,search);
		}else if(category.equals("title")) {
			int listCount = reviewService.selectTitleListCount(search);
			// System.out.println(listCount);
			int pageLimit = 10;
			int boardLimit = 5;
			// PageInfo 객체 만들어 내기
			pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
			list = reviewService.selectTitleList(pi,search);
		}else if(category.equals("writer")) {
			int listCount = reviewService.selectWriterListCount(search);
			// System.out.println(listCount);
			int pageLimit = 10;
			int boardLimit = 5;
			// PageInfo 객체 만들어 내기
			pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
			list = reviewService.selectWriterList(pi,search);
		}
		
		

		
		model.addAttribute("ticket",ticket);
		model.addAttribute("list",list);
		model.addAttribute("category",category);
		model.addAttribute("search",search);
		model.addAttribute("pi",pi);
		
		return "review/reviewListView";
	}
	
	@GetMapping(value = "myReviewList.re", produces = "text/html; charset=UTF-8")
	public String myReviewList( Model model, HttpSession session) {
		
		int userNo= ((Member)session.getAttribute("loginUser")).getMemberNo();
		
		ArrayList<Review> list = reviewService.myReviewList(userNo);
		
		for (Review review : list) {
			System.out.println(review);
		}
		model.addAttribute("list",list);
		return "review/myReviewList";
	}
}
