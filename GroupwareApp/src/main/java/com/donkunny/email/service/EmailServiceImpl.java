package com.donkunny.email.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.donkunny.email.Email;
import com.donkunny.email.persistence.EmailDAO;

@Service
public class EmailServiceImpl implements EmailService{

	@Inject
	public EmailDAO dao;
	
	@Override
	public void sendPost(Email mail) throws Exception {
		dao.sendMail(mail);
	}
}
