package com.donkunny.email.persistence;

import com.donkunny.email.Email;

public interface EmailDAO {
	public void sendMail(Email mail) throws Exception;
}
