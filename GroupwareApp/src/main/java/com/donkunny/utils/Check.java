package com.donkunny.utils;

public class Check {
	public static boolean check(String article, int from, int to){
		if(article.length() > from && article.length() < to)
			return true;
		else
			return false;
	}
	
	public static boolean mail(String email){
		if(email.contains("@") && email.length()>0 && email.length() < 20)
			return true;
		else 
			return false;
	}
	
	public static boolean pwd(String pwd, String pwd_confirm){
		if(pwd.length() > 5 && pwd.length() < 17){
			if(pwd.equals(pwd_confirm))
				return true;
			else
				return false;
		} else
			return false;
	}
	
	public static boolean tel(String tel){
		if(!(tel.contains("-") || tel.contains("!") || tel.contains("@") || tel.contains("#") || tel.contains("$") || tel.contains("%") 
				|| tel.contains("^") || tel.contains("&")) && tel.length() > 0 && tel.length() <20)
			return true;
		else
			return false;
	}
}