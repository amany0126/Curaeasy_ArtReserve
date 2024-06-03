package com.kh.curaeasy.reserve.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ReserveController {

	@RequestMapping("reserve.do")
	public String reserveInfo() {
		return "reserve/reserveInfo";
	}
}
