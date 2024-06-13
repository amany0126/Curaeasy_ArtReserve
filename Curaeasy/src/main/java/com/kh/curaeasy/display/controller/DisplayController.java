package com.kh.curaeasy.display.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.kh.curaeasy.display.model.service.DisplayService;
import com.kh.curaeasy.display.model.vo.Display;
import com.kh.curaeasy.display.model.vo.DisplayAttachment;

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
    
    @RequestMapping("insertDisplay.do")
    public void insertDisplay(Display d, ArrayList<MultipartFile> upfile, HttpSession session) {
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
    	System.out.println(result);
    	
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
    
    
    
}
