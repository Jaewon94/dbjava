package com.javabang.interceptor;

import java.net.URLEncoder;


import com.javabang.model.MemberDTO;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AdminInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		HttpSession session = request.getSession();
		MemberDTO login = (MemberDTO) session.getAttribute("login");

		if (login != null && "admin".equals(login.getUserId())) {
			return true;
		}
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();

		requestURI = requestURI.substring(contextPath.length());
		requestURI = URLEncoder.encode(requestURI, "UTF-8");
		response.sendRedirect(contextPath + "/");

		return false;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
		// Optional: Implement any post-request logic if needed
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
		// Optional: Cleanup resources or handle after-request activities if needed
	}
}