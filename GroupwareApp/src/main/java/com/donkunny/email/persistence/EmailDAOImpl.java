package com.donkunny.email.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.donkunny.email.Email;

@Repository
public class EmailDAOImpl implements EmailDAO{

	@Inject
	SqlSession session; 
	
	private static String namespace ="com.donkunny.mapper.EmailMapper";
	
	@Override
	public void sendMail(Email mail) throws Exception {
		session.insert(namespace+".sendPost", mail);
	}
	
}
