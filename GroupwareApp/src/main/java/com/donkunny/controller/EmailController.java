package com.donkunny.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.donkunny.email.Email;
import com.donkunny.email.EmailSender;

@Controller
@RequestMapping("/email/*")
public class EmailController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private EmailSender emailsender;
	
	@RequestMapping(value="/emailsender", method=RequestMethod.GET)
	public void sendEmailGET(){

	}
	
	@RequestMapping(value="/emailsender", method=RequestMethod.POST)
	public String sendEmailPOST(Email email) throws Exception{
		logger.info(email.getContent());
		
		emailsender.sendEmail(email);
		
		return "redirect:/main/mainPage";
	}
}
