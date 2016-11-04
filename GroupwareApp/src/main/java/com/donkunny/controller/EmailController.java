package com.donkunny.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.donkunny.email.Email;
import com.donkunny.email.service.EmailService;


@Controller
@RequestMapping("/email/*")
public class EmailController {
	
	@Inject
	private EmailService service;
	
	@RequestMapping(value="/emailsender", method=RequestMethod.GET)
	public void sendEmailGET(){
	}
	
	@RequestMapping(value="/emailsender", method=RequestMethod.POST)
	public String sendEmailPOST(Email mail) throws Exception{
		service.sendPost(mail);
		return "redirect:/email/emailsenderPost";
	}
	
	@RequestMapping(value="/emailsenderPost", method=RequestMethod.GET)
	public void sendEmailPOST() throws Exception{
	}
	
}
