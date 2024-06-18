package com.kh.curaeasy.reserve.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.curaeasy.display.model.service.DisplayService;
import com.kh.curaeasy.display.model.vo.Display;
import com.kh.curaeasy.display.model.vo.DisplayAttachment;

@Controller
public class ReserveController {
	
	@Autowired
	DisplayService dService;
	
	@RequestMapping("reserve.do")
	public String reserveInfo() {
		return "reserve/reserveInfo";
	}
	
	@RequestMapping(value="reserveDisplay.do")
    public ModelAndView reserveDisplay(int disNo, String staDay, int amount, ModelAndView mv) {
    	
		Display d = dService.selectDisplay(disNo);
		ArrayList<DisplayAttachment> list = dService.selectDisplayAttachment(disNo);
		DisplayAttachment at = null;
		for(DisplayAttachment a : list) {
			if(a.getImageLevel() == 1) {
				at = a;
			}
		}
		
		mv.addObject("d", d)
		  .addObject("at", at)
		  .addObject("staDay", staDay)
		  .addObject("amount", amount)
		  .setViewName("reserve/reserveInfo");
    	
    	return mv;
    }
}
