package com.google.Passenger;

import java.io.IOException;

import javax.servlet.http.*;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.PreparedQuery;
import com.google.appengine.api.datastore.Query;
import com.google.appengine.api.datastore.Query.Filter;
import com.google.appengine.api.datastore.Query.FilterPredicate;

@SuppressWarnings("serial")
public class PassengerValidation extends HttpServlet {
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setContentType("text/plain");
	
		String username=request.getParameter("Pusername");
		String password=request.getParameter("Ppassword");
		
		DatastoreService ds = DatastoreServiceFactory.getDatastoreService();
		
		Query q = new Query("PassengerDetailsTable");
		
		Filter filter=new FilterPredicate("name",Query.FilterOperator.EQUAL,username);
		q.setFilter(filter);
		q.addSort("name");
		
		String dPass=null;
		PreparedQuery pq = ds.prepare(q);
		for(Entity result : pq.asIterable()){
			dPass = result.getProperty("password").toString();
		}
		
		if(password.equals(dPass)){
			HttpSession session = request.getSession();
			session.setAttribute("user", username);
			session.setMaxInactiveInterval(30*60);
			
			Cookie userName = new Cookie("user", username);
			userName.setMaxAge(30*60);
			response.addCookie(userName);
			
			response.sendRedirect("PassengerSuccessPage.jsp");
	       
		
		} else {
			response.getWriter().println("Unsuccessful LogIn");
		}
	}
		
	}
