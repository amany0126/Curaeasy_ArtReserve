package com.kh.curaeasyadmin.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.curaeasyadmin.model.service.AdminService;
import com.kh.curaeasyadmin.model.vo.Display;

public class AdminController {
	
	@Autowired
	private AdminService adminservice;
	
	
    @RequestMapping("index")
    public String index(Model model) {
    	ArrayList<Display> list = adminservice.mainPageSelectDisplayList();
        model.addAttribute("displayList", list);
        return "index"; //
    }
	

//	@RequestMapping("displaylist.ad")
//    public String displayList(Model model) {
//        ArrayList<Display> list = adminservice;
//        model.addAttribute("displayList", list);
//        return "display/displaylist";
//    }

    @RequestMapping("noticelist.ad")
    public String noticeList(Model model) {
        // You need to implement this method to fetch and display notices.
        return "notice/noticelist";
    }
}
