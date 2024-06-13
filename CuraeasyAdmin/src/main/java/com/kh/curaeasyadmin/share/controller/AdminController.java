package com.kh.curaeasyadmin.share.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

@Controller
public class AdminController {
	
	public String adminPage(Model model, HttpSession session) {
		
		model.addAttribute("message", "관리자페이지!!");
		
		return "common/adminmain";
		
	}

}
