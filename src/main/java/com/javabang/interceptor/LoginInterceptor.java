package com.javabang.interceptor;


import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.net.URLEncoder;

public class LoginInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		HttpSession session = request.getSession();

		if (session.getAttribute("login") != null) {
			return true;
		}

		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();

		requestURI = requestURI.substring(contextPath.length());
		requestURI = URLEncoder.encode(requestURI, "UTF-8");
		response.sendRedirect(contextPath + "/member/login?url=" + requestURI);

		return false;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
		// Implementation can be provided as needed.
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
		// Implementation can be provided as needed.
	}
}