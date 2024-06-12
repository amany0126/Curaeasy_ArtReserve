package com.kh.curaeasy.display.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.curaeasy.display.model.service.DisplayService;
import com.kh.curaeasy.display.model.vo.Display;

@Controller
public class DisplayController {
	
	@Autowired
	private DisplayService displayService;

    @RequestMapping("onDisplay.do")
    public String ongoingDisplay() {
        return "display/onDisplayView";
    }

    @RequestMapping("offDisplay.do")
    public String closedDisplay() {
        return "display/closedDisplayView";
    }
    
    @RequestMapping("displayDetail.do")
    public String displayDetail() {
        return "display/displayDetailView";
    }
    
    @RequestMapping("upcomingDisplay.do")
    public String upcomingDisplay() {
        return "display/upcomingDisplayView";
    }
    
    @RequestMapping(value="mainPageSelectDisplayList.do", produces="application/json; charset=utf-8")
    @ResponseBody
    public String mainPageSelectDisplayList() {
    	
    	// 현재 진행중인 전시 리스트 가져오기
    	ArrayList<Display> list = displayService.mainPageSelectDisplayList();
    	return new Gson().toJson(list);
    }
    @RequestMapping("displayAdd.do")
    public String displayAdd() {
        return "display/displayEnrollForm";
    }
    
}
