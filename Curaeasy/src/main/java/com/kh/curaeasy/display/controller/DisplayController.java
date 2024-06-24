package com.kh.curaeasy.display.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.kh.curaeasy.display.model.service.DisplayService;
import com.kh.curaeasy.display.model.vo.Display;
import com.kh.curaeasy.display.model.vo.DisplayAttachment;
import com.kh.curaeasy.member.model.service.MemberService;
import com.kh.curaeasy.member.model.vo.Member;
import com.kh.curaeasy.rental.model.service.RentalService;

@Controller
public class DisplayController {
	
	@Autowired
	private DisplayService displayService;
	@Autowired private RentalService rentalService;
	
	@Autowired
	private MemberService memberService;

    
	@RequestMapping("onDisplay.do")
	public String onDisplayList(Model model, HttpSession session) {
	    // 현재 진행 중인 전시 목록 조회
	    ArrayList<Display> list = displayService.selectOnDisplayList();
	    
	    List<Integer> likeDisplayList = null;
	    if(session.getAttribute("loginUser") != null) {
	    	// 좋아요 리스트 가져오기
	    	likeDisplayList = memberService.checkLikeList(((Member)session.getAttribute("loginUser")).getMemberNo());
	    }
	    
	    model.addAttribute("onDisplayList", list);
	    model.addAttribute("displayNoList", likeDisplayList);
	    
	    return "display/onDisplayView";
	}
    @RequestMapping("upcomingDisplay.do")
    public String upcomingDisplay(Model model) {
    	// 진행 예정 전시 목록 조회
	    ArrayList<Display> list = displayService.selectUpcomingDisplayList();
	    
	    model.addAttribute("upcomingDisplayList", list);
    	
        return "display/upcomingDisplayView";
    }
    @RequestMapping("offDisplay.do")
    public String closedDisplay(Model model) {
    	// 마감 전시 목록 조회
	    ArrayList<Display> list = displayService.selectClosedDisplayList();
	    
	    model.addAttribute("closedDisplayList", list);
	    
        return "display/closedDisplayView";
    }
    
    @RequestMapping("displayDetail.do")
    public String displayDetail(int dno, Model model) {
    	
    	// 선택한 작품번호의 작품과 첨부파일 가져오기
    	Display d = displayService.selectDisplay(dno);
    	ArrayList<DisplayAttachment> list = displayService.selectDisplayAttachment(dno);
    	
    	model.addAttribute("d", d);
    	model.addAttribute("list", list);
    	
        return "display/displayDetailView";
    }
    
    
    @RequestMapping("displayAdd.do")
    public String displayAdd() {
        return "display/displayEnrollForm";
    }
    
    @RequestMapping("insertDisplay.do")
    public String insertDisplay(Display d, ArrayList<MultipartFile> upfile, HttpSession session) {
    	System.out.println(d);
    	System.out.println(upfile);
    	
    	ArrayList<DisplayAttachment> fileList = new ArrayList<DisplayAttachment>();
    	
    	for (int i = 0; i < upfile.size(); i++) {
    		MultipartFile file = upfile.get(i);
    		
			if(!file.getOriginalFilename().equals("")) {
				String changeName = savePath(file, session);
				
				DisplayAttachment at = new DisplayAttachment();
				at.setOriginName(file.getOriginalFilename());
				at.setChangeName(changeName);
				at.setImageLevel((i == 0) ? 1 : 2);
				fileList.add(at);
			}
		}
    	
    	System.out.println(fileList);
    	
    	int result = displayService.insertDisplay(d, fileList);
    	
    	
    	return "/main";
    	
    }
    
    public String savePath(MultipartFile upfile, HttpSession session) {

		String originName = upfile.getOriginalFilename();
		
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		
		int ranNum = (int)(Math.random() * 90000 + 10000);
		
		String ext = originName.substring(originName.lastIndexOf(".")); // ".jpg"
		
		String changeName = currentTime + ranNum + ext;
		
		String savePath = session.getServletContext()
								 .getRealPath("/resources/displayImgs/");
		
		try {
			upfile.transferTo(new File(savePath + changeName));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		return changeName;
	}
    
    @GetMapping(value = "exhibition.do",produces = "text/html; charset=UTF-8")
    public String MydisplayList( HttpSession session, Model model) {
    	
    	// 선택한 작품번호의 작품과 첨부파일 가져오기
    	int userNo= ((Member)session.getAttribute("loginUser")).getMemberNo();
    	int artistNo = rentalService.artistNo(userNo);
    	
    	ArrayList<DisplayAttachment> list = displayService.mydisplayList(artistNo);
    	
    	
    	model.addAttribute("list", list);
    	
        return "display/myDisplayList";
    }
    
    @RequestMapping(value="displayCalander.do", produces = "application/json")
    public String displayCalendar(Model model) {
    	
    	ArrayList<Display> list = displayService.selectDisplayList();
    	model.addAttribute("list", new Gson().toJson(list));
    	return "display/displayCalendar";
    }
    
}
