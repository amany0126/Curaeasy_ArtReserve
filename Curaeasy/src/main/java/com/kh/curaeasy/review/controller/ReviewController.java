package com.kh.curaeasy.review.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ReviewController {

	@RequestMapping("Review.do")
	public String reviewList() {
		return "review/reviewListView";
	}
}
