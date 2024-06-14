package com.kh.curaeasy.rental.controller;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.curaeasy.member.model.vo.Member;
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
	public String calendar(int gno ,Model model) {
		ArrayList<Rental> list = rentalService.calendar(gno);
		
		java.util.Date certTime = new java.util.Date();
		java.util.Date certTime1 = new java.util.Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd"); 
		certTime.setDate(certTime.getDate()+ 1);
		String today = ""+dateFormat.format(certTime)+"";
		String today1 = ""+dateFormat.format(certTime1)+"";
		if(gno<1 || gno>6) {
			model.addAttribute("errorMsg", "유효하지 않은 접근입니다");
			return "/common/errorPage";
		}else {
			
			model.addAttribute("gno",gno);
			model.addAttribute("today",today);
			model.addAttribute("today1",today1);
			model.addAttribute("list",list);
			return "rental/rentalCalendar" ;
		}
		
		
	}
	
	@PostMapping(value = "/inrollFrom.re",produces = "text/html; charset=UTF-8")
	public String displayRentalForm(int disNo,Date staDay ,Model model) {
		
		
		Rental rn = new Rental();
		rn.setGalleryNo(disNo);
		rn.setRentalStartDate(staDay);
		
		// System.out.println(rn.getGalleryNo());
		// System.out.println(rn.getRentalStartDate());		
		int ValidDate = rentalService.ValidDate(rn);
//		System.out.println(ValidDate);
		
		
		if(ValidDate > 0 || disNo<1 || disNo>6 ) {
			model.addAttribute("errorMsg", "유효하지 않은 접근입니다");
			return "/common/errorPage";
		}else {
			model.addAttribute("rn",rn);
			return "rental/ApplyForTemporaryAdmission" ;
		}
		
		
	}
	@ResponseBody
	@GetMapping(value="dayCheck.re", produces = "text/html; charset=UTF-8")
	public String dayCheck(Date endDay,int disNo,Date staDay) {
		Rental rn = new Rental();
		
		rn.setRentalStartDate(staDay);
		rn.setGalleryNo(disNo);
		rn.setRentalEndDate(endDay);
		
		int count = rentalService.dayCheck(rn);
		int checkEndDay = rentalService.checkEndDay(rn);
		int checkStdDay = rentalService.checkStdDay(rn);
		

		
		return (checkStdDay+count+checkEndDay !=0)? "NNNNN" : "NNNNY";
	}
	
	@PostMapping(value ="/applyRrental.re", produces = "text/html; charset=UTF-8")
	public String ApplyRrental(Rental r, Model model, HttpSession session) {
		int userNo= ((Member)session.getAttribute("loginUser")).getMemberNo();
		int artistNo = rentalService.artistNo(userNo);
		
		r.setArtistNo(artistNo);
		int result = rentalService.result(r);
		
		if(result>0) {
			session.setAttribute("alertMsg", "대관신청에 성공하셨습니다");
			return "/main";
		}else {
			model.addAttribute("errorMsg", "대관신청에 실패하셨습니다.");
			return "/common/errorPage";
		}
	}
}
