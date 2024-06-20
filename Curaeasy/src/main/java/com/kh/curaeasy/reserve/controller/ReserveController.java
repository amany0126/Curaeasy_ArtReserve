package com.kh.curaeasy.reserve.controller;

import java.util.ArrayList;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.curaeasy.display.model.service.DisplayService;
import com.kh.curaeasy.display.model.vo.Display;
import com.kh.curaeasy.display.model.vo.DisplayAttachment;
import com.kh.curaeasy.member.controller.EmailController;
import com.kh.curaeasy.member.model.vo.Member;
import com.kh.curaeasy.reserve.model.service.ReserveService;
import com.kh.curaeasy.reserve.model.vo.Reserve;

@Controller
public class ReserveController {
	
	@Autowired
	DisplayService dService;
	
	@Autowired
	ReserveService rService;
	
	@Autowired
	JavaMailSender mailSender;
	
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
		
		int price = d.getDisplayPrice() * amount;
		
		mv.addObject("d", d)
		  .addObject("at", at)
		  .addObject("staDay", staDay)
		  .addObject("amount", amount)
		  .addObject("price", price)
		  .setViewName("reserve/reserveInfo");
    	
    	return mv;
    }
	
	@RequestMapping(value="insertReserve.do")
	@ResponseBody
	public String insertReserve(Reserve data, Model model, HttpSession session, HttpServletRequest request) throws MessagingException {
		
		rService.insertReserve(data);
		Reserve r = rService.selectLastInsertedReserve(data.getMemberNo());
		
		String emailStr = new EmailController()
						.PaymentConfirmation(r.getReserveNo(),
											 r.getReserveCount(),
											 r.getEntranceDate(),
											 r.getPaymentPrice());
		
		MimeMessage mimeMessage  = mailSender.createMimeMessage();
		MimeMessageHelper messageHelper = new MimeMessageHelper(mimeMessage , true ,"UTF-8");
		messageHelper.setSubject("[크레이지] 예약하신 전시 내용입니다."); 
		messageHelper.setText(emailStr,true);
		messageHelper.setTo(((Member)session.getAttribute("loginUser")).getMemberEmail());
		mailSender.send(mimeMessage);
		
		model.addAttribute("eventMsg", "결제가 완료되었습니다.");
		return "결제성공함";
	}
	
	@RequestMapping(value="reserveComplete.do", produces = "text/html; charset=utf-8")
	public ModelAndView reserveComplete(ModelAndView mv, HttpSession session) {
		Reserve r = rService.selectLastInsertedReserve(String.valueOf(((Member)session.getAttribute("loginUser")).getMemberNo()));
		Display d = dService.selectDisplay(Integer.parseInt(r.getDisplayNo()));
		mv.addObject("r", r)
		  .addObject("d", d)
		  .setViewName("reserve/reserveComplete");
		
		return mv;
	}
	
	@RequestMapping(value="reserveList.me")
	public String reserveList(HttpSession session, Model model) {
		
		int memberNo = ((Member)session.getAttribute("loginUser")).getMemberNo();
		
		ArrayList<Reserve> list = rService.selectReserveList(memberNo);
		
		model.addAttribute("list", list);
		
		return "reserve/myReserveList";
	}
}
