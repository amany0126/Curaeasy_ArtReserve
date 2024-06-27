package com.kh.curaeasy.intro.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.curaeasy.intro.model.service.IntroService;
import com.kh.curaeasy.notice.model.vo.Notice;

@Controller
public class IntroController {
	
	@Autowired
	private IntroService introService;

    @RequestMapping("intro.do")
    public String intro() {
        return "intro/intro";
    }

    @RequestMapping("location.do")
    public String location() {
        return "intro/location";
    }

    @RequestMapping("about.do")
    public String about() {
        return "intro/about";
    }

    @RequestMapping("gallery.do")
    public String gallery() {
        return "intro/gallery";
    }

    @RequestMapping("organization.do")
    public String organization() {
        return "intro/organization";
    }
    
    @RequestMapping(value="mainPageSelectList.do", produces="application/json; charset=utf-8")
    @ResponseBody
    public String mainPageSelectList(Model model) {
    	
    	// 값 저장할 HashMap 생성
    	HashMap<String, Object> map = new HashMap<>();
    	
    	
    	Notice notice =  introService.SelectLatestNotice();
    	notice.setNoticeContent(notice.getNoticeContent().replace("<br>", ""));
    	
    	// 메인 페이지에 표시할 최신 전시, 공지, 작가 가져오기
    	map.put("display", introService.SelectLatestDisplay());
    	map.put("artist", introService.SelectLatestArtist());
    	map.put("notice", notice);
    	return new Gson().toJson(map);
    	
    }
}