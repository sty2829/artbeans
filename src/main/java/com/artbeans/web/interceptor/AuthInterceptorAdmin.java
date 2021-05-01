package com.artbeans.web.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import lombok.extern.slf4j.Slf4j;

@Component
public class AuthInterceptorAdmin implements HandlerInterceptor {
	
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession hs = request.getSession();
		
		if(hs.getAttribute("admin")==null) {
			request.setAttribute("msg", "관리자 이외에 접근 불허");
			request.getRequestDispatcher("/views/admin/admin-msg").forward(request,response);
			return false;
		}
		return true;
	}
}
