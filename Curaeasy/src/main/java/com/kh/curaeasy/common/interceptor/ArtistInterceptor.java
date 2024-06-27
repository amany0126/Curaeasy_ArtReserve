package com.kh.curaeasy.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.kh.curaeasy.member.model.vo.Member;

public class ArtistInterceptor extends HandlerInterceptorAdapter {
	
	// 1. 로그인한 회원만 접근 가능한 서비스 servlet-context.xml 에 매핑
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
	
		
	if(session.getAttribute("loginUser") != null) {
		
		if((session.getAttribute("loginUser") != null && ((Member)session.getAttribute("loginUser")).getArtistOngoing().equals("Y"))) {
			
			return true;
			
		} else {
			session.setAttribute("alertMsg", "작가만 이용 가능한 서비스입니다.");
			response.sendRedirect(request.getContextPath());
			
			return false;
		}
			
			
		} else {
			session.setAttribute("alertMsg", "로그인 후 이용 가능한 서비스입니다.");
			response.sendRedirect(request.getContextPath());
			// 로그인이 필요한 서비스입니다 메세지 띄워주고 로그인페이지로 포워딩
			
			return false;
		}
	}
}
