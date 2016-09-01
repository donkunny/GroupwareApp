package com.donkunny.control;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.donkunny.member.MemberVO;
import com.donkunny.member.TempMemberVO;
import com.donkunny.member.login.LoginDTO;
import com.donkunny.member.service.MemberService;

@Controller
@RequestMapping("/member/*")
public class MemberController {

	@Inject
	MemberService service;
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public void loginGET(@ModelAttribute("dto") LoginDTO dto, Model model){
		logger.info("login get...");
	}
	
	@RequestMapping(value="/loginPost", method=RequestMethod.POST)
	public String loginPOST(LoginDTO dto, HttpSession session, RedirectAttributes rttr) throws Exception{
		logger.info("login post...");
		
		MemberVO vo = service.confirmLogin(dto);
		if(vo == null) {
			rttr.addFlashAttribute("error", "아이디 또는 비밀번호를 다시 확인하세요.");
			return "redirect:/member/login"; 
		} else {
			session.setAttribute("memberVO", vo); // 로그인이 필요한 페이지에서 session으로 로그인 확인
			return "redirect:../main/mainPage";
		}
	}
	
	@RequestMapping(value="/logout", method=RequestMethod.GET)
	public String logout(HttpSession session, RedirectAttributes rttr) throws Exception {
		session.removeAttribute("memberVO");
		session.invalidate();
		rttr.addFlashAttribute("error", "로그아웃 되었습니다.");
		return "redirect:/member/login";
	}
	
	@RequestMapping(value="/register", method=RequestMethod.GET)
	public void registerMember(){
		logger.info("register members");
	}
	
	@RequestMapping(value="/register", method=RequestMethod.POST)
	public String registerPost(TempMemberVO tvo) throws Exception{
		service.register(tvo);
		// logger.info(tvo.getT_id()+","+tvo.getT_id() +"," + tvo.getT_pwd() +"," + tvo.getT_email());
		return "/member/registerConfirm";
	}

	/*	
	@RequestMapping(value="/registerConfirm", method=RequestMethod.GET)
	public void registerConfirm(int tno, Model model) throws Exception{
		// model.addAttribute("tempMemberVO", tno);
	}
	*/	
	
	@RequestMapping(value="/memberInfo", method=RequestMethod.GET)
	public void checkMemberInfo(HttpSession session, Model model) throws Exception {
		logger.info("member info...");
		
		model.addAttribute("memberVO", service.checkMemberInfo((MemberVO)session.getAttribute("memberVO")));
	}
	
}