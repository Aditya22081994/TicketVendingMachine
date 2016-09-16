package com.google.Passenger;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;

@SuppressWarnings("serial")
public class PassengerLogOut extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		response.setContentType("text/plain");
		
		RequestDispatcher rd = request.getRequestDispatcher("Homepage.html");
		
		Cookie[] cookies = request.getCookies();
    	if(cookies != null){
    	for(Cookie cookie : cookies){
    		if(cookie.getName().equals("JSESSIONID")){
    		 			break;
    		}
    	}
    	}
    	//invalidate the session if exists
    	HttpSession session = request.getSession(false);
    	    	if(session != null){
    		session.invalidate();
    	}
		
		
		
		rd.forward(request, response);
		
	}
}
