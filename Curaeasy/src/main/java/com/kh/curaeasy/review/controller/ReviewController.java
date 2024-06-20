package com.kh.curaeasy.review.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.curaeasy.member.model.vo.Member;
import com.kh.curaeasy.review.model.service.ReviewService;
import com.kh.curaeasy.review.model.vo.Review;

@Controller
public class ReviewController {
	@Autowired private ReviewService reviewService;
	@RequestMapping("review.do")
	public String reviewList() {
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
