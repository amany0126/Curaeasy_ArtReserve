package com.kh.curaeasy.intro.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IntroController {

	@RequestMapping("intro.do")
	public String reviewList() {
		return "intro/intro";
	}
}
