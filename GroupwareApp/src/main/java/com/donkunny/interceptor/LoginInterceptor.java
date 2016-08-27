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
import com.donkunny.member.MemberVO;

/**
 * 로그인이 필요한 컨트롤러 마다 로그인 체크 로직 구현
 * @author donkunny
 *
 */
public class LoginInterceptor extends HandlerInterceptorAdapter{

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	// Controller 이벤트 호출 전
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		logger.info("prehandle before accessing Controller...");
		//session 검사
		HttpSession session = request.getSession(false);
	
		if(session == null){
			// 처리를 끝냄 - 컨트롤러로 요청이 가지 않음
			logger.info("no session, access denied!");
			response.sendRedirect("/member/login");
			return false;
		} else if(session.getAttribute("memberVO") == null){
			logger.info("no attribute of session, access denied");
			response.sendRedirect("/member/login");
			return false;
		}
		
		return true;
	}


}
