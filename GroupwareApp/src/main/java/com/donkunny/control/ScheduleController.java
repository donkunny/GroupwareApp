package com.donkunny.control;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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
		logger.info("scheduler main...");
		
	}
	
	@RequestMapping(value="/register", method=RequestMethod.POST)
	public @ResponseBody ScheduleVO register(@RequestBody ScheduleVO svo){
		try {
			service.registerSchedule(svo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return svo;
	}

	
}
