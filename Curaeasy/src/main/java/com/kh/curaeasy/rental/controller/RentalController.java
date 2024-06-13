package com.kh.curaeasy.rental.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.curaeasy.rental.model.service.RentalService;
import com.kh.curaeasy.rental.model.vo.Rental;

@Controller
public class RentalController {
	@Autowired private RentalService rentalService;
	@RequestMapping("rentalInfo.do")
	public String rentalInfo() {
		return "rental/rentalInfo";
	}
	@RequestMapping("rental.do")
	public String rental() {
		return "rental/rentalEnrollForm";
	}
	
	@GetMapping("/calendar.re")
	public String calendar(String gno ,Model model) {
		System.out.println(gno);
		ArrayList<Rental> list = rentalService.calendar(gno);
		//System.out.println(list.size());
		
		for (int i = 0; i < list.size(); i++) {
			System.out.println(list.get(i).getRentalStartDate());
			System.out.println(list.get(i).getRentalStartDate());
			
		}
		
		model.addAttribute("gno",gno);
		model.addAttribute("list",list);
		return "rental/rentalCalendar" ;
	}
}
