package com.kh.curaeasyadmin.member.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.curaeasyadmin.common.model.vo.PageInfo;
import com.kh.curaeasyadmin.member.model.service.AdminMemberService;
import com.kh.curaeasyadmin.member.model.vo.AdminMember;
import com.kh.curaeasyadmin.template.Pagination;

@Controller
public class AdminMemberController {
	
	@Autowired private BCryptPasswordEncoder bcryptPasswordEncoder;
	@Autowired private AdminMemberService memberService;
	
	@GetMapping("list.me")
	public String selectList(@RequestParam(value="cpage", defaultValue="1") int currentPage, Model model) {
		
		int listCount = AdminMemberService.selectListCount();
		int pageLimit = 10;
		int boardLimit = 5;
		
		PageInfo pi 
			= Pagination.getPageInfo(listCount, 
								 	 currentPage, 
								 	 pageLimit, 
								 	 boardLimit);
		
		ArrayList<AdminMember> list = AdminMemberService.selectList(pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		return "member/adminMemberListView";
	}

}
