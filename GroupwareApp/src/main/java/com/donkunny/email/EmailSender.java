package com.donkunny.email;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;

public class EmailSender {
	
	@Autowired
	protected JavaMailSender mailsender;
	public void sendEmail(Email email) throws Exception {
		MimeMessage msg = mailsender.createMimeMessage();
		try {
			msg.setSubject(email.getSubject());
			msg.setText(email.getContent());
			msg.setRecipients(MimeMessage.RecipientType.TO , InternetAddress.parse(email.getReceiver()));
			
		} catch(MessagingException e) {
            System.out.println("MessagingException");
            e.printStackTrace();
        }
		
        try {
            mailsender.send(msg);
        }catch(MailException e) {
            System.out.println("MailException발생");
            e.printStackTrace();
        }
	}
}
