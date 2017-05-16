package com.bidding.web.utils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class SessionUtils {
	
	public static void createSession(HttpServletRequest request,String userName)
	{
		HttpSession session = request.getSession();
		session.setAttribute("USER", userName);
	}
	
	public static int getSession(HttpSession session,String userName)
	{
		if(session.getAttribute("USER") != null)
			return 1;
		else
			return 0;
	}
	
	public static void logout(HttpSession session)
	{
		session.invalidate();
	}
	
}
