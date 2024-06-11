package com.kh.curaeasy.rental.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RentalController {

	@RequestMapping("rentalInfo.do")
	public String rentalInfo() {
		return "rental/rentalInfo";
	}
	@RequestMapping("rental.do")
	public String rental() {
		return "rental/rentalEnrollForm";
	}
}
