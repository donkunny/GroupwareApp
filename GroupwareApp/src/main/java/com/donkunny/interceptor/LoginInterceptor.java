package com.donkunny.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.donkunny.control.MemberController;

/**
 * 로그인이 필요한 컨트롤러 마다 로그인 체크 로직 구현
 * @author donkunny
 *
 */
public class LoginInterceptor extends HandlerInterceptorAdapter{

	private static final String LOGIN = "loginSuccess";
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	// Controller 이벤트 호출 전
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		HttpSession session = request.getSession();
		if(session.getAttribute(LOGIN) != null){
			logger.info("clear login data before");
			session.removeAttribute(LOGIN);
		}
		
		return true;
	}

	// Controller 호출 후 view 페이지 출력 후
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {

		HttpSession session = request.getSession();
		ModelMap modelMap = modelAndView.getModelMap();
		Object memberVO = modelMap.get("memberVO");
		
		if(memberVO != null) {
			logger.info("new login success");
			session.setAttribute(LOGIN, memberVO);
			response.sendRedirect("/test");
		}
	}

	
	
}
