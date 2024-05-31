package com.kh.curaeasy.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MemberController {
	/*
	 * @Autowired private BCryptPasswordEncoder bcryptPasswordEncoder;
	 * 
	 * @Autowired private MemberService memberService;
	 */
	@GetMapping("enrollForm.me")
	public String enrollForm() {
		// 단순히 회원가입 페이지만 포워딩
		// /WEB-INF/views/member/memberEnrollForm.jsp
		return "member/memberEnrollForm";
	}
}
