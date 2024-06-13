package com.kh.curaeasyadmin.notice.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.curaeasyadmin.common.model.vo.PageInfo;
import com.kh.curaeasyadmin.notice.model.service.AdminNoticeService;
import com.kh.curaeasyadmin.notice.model.vo.AdminNotice;
import com.kh.curaeasyadmin.template.Pagination;

@Controller
public class AdminNoticeController {
	
//	@Autowired private BCryptPasswordEncoder bcryptPasswordEncoder;
//	@Autowired private AdminNoticeService noticeService;
//	
	/*
	
	@GetMapping("list.no")
	public String selectNoticeList(@RequestParam(value="cpage", defaultValue="1") int currentPage, Model model) {
		
		int listCount = AdminNoticeService.selectListCount();
		int pageLimit = 10;
		int boardLimit = 5;
		
		PageInfo pi 
			= Pagination.getPageInfo(listCount, 
								 	 currentPage, 
								 	 pageLimit, 
								 	 boardLimit);
		
		ArrayList<AdminNotice> list = AdminNoticeService.selectNoticeList(pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		return "notice/adminNoticeView";
	}
*/

}
