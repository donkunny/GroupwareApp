package com.donkunny.control;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.donkunny.board.paging.CriForSchedule;
import com.donkunny.board.paging.Criteria;
import com.donkunny.board.paging.PageMaker;
import com.donkunny.member.MemberVO;
import com.donkunny.schedule.ScheduleVO;
import com.donkunny.schedule.service.ScheduleService;

@Controller
@RequestMapping("/schedule/*")
public class ScheduleController {

	@Inject
	private ScheduleService service;
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@RequestMapping(value="/main", method=RequestMethod.GET)
	public void showMainPage(){
		logger.info("scheduler main get...");

	}
	
	@RequestMapping(value="/register", method=RequestMethod.POST)
	public String register(ScheduleVO svo){
		logger.info(svo.toString());

		try{
			service.registerSchedule(svo);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return "redirect:/schedule/slist";
	}
	
	@RequestMapping(value="/slist", method=RequestMethod.GET)
	public void slist(@ModelAttribute("cri") CriForSchedule cri, HttpSession session, Model model) throws Exception{
		
		cri.setS_id(((MemberVO)session.getAttribute("memberVO")).getId());
		logger.info(cri.toString() + ", [count: " + service.countPaging() +"]");
		
		model.addAttribute("list", service.listPage(cri));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setPaginationForSchedule(service.countPaging());
		model.addAttribute("pageMaker", pageMaker);
	}
	
	@RequestMapping(value="/myRegister", method=RequestMethod.GET)
	public void myscheduleRegister(){
		
	}
	
	@RequestMapping(value="/scheduleCalendar", method=RequestMethod.GET)
	public void setscheduleCalendarGET(Model model) throws Exception{
		model.addAttribute("scheduleList", service.readAllMySchedule());
		
	}
	
	@RequestMapping(value="/scheduleCalendar", method=RequestMethod.POST)
	public void setscheduleCalendarPOST(){
		
	}
	
}
