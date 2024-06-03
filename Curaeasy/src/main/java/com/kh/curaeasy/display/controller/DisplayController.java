package com.kh.curaeasy.display.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DisplayController {

	@RequestMapping("display.do")
	public String displayList() {
		return "display/displayListView";
	}
}
