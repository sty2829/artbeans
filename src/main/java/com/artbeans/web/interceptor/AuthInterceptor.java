package com.artbeans.web.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

@Component
public class AuthInterceptor implements HandlerInterceptor {
	
	
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		HttpSession hs = request.getSession();
		if(hs.getAttribute("userInfo")==null){
			request.setAttribute("msg", "로그인이 필요한 페이지 입니다.");
			request.getRequestDispatcher("/views/user/msg").forward(request,response);
			return false;
		}
		
		return true;
	}

}
