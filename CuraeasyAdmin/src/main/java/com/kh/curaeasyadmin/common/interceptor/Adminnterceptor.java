package com.kh.curaeasyadmin.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class Adminnterceptor extends HandlerInterceptorAdapter {
	
//	// 1. 로그인한 회원만 접근 가능한 서비스 servlet-context.xml 에 매핑
//	
//	@Override
//	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
//			throws Exception {
//		
//		HttpSession session = request.getSession();
//		
//		if(session.getAttribute("loginUser") != null) {
//			
//			return true;
//			
//		} else {
//			session.setAttribute("alertMsg", "로그인 후 이용 가능한 서비스입니다.");
//			response.sendRedirect(request.getContextPath());
//			
//			return false;
//		}
//	}
}
