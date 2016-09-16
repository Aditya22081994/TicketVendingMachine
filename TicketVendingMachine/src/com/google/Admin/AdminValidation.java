package com.google.Admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.PreparedQuery;
import com.google.appengine.api.datastore.Query;
import com.google.appengine.api.datastore.Query.Filter;
import com.google.appengine.api.datastore.Query.FilterPredicate;

@SuppressWarnings("serial")
public class AdminValidation extends HttpServlet {
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		response.setContentType("text/html");
		
		RequestDispatcher rd = request.getRequestDispatcher("AdministratorSuccessPage.jsp");
		
		String username=request.getParameter("Ausername");
		String password=request.getParameter("Apassword");
		
		DatastoreService ds = DatastoreServiceFactory.getDatastoreService();
		
		Query q = new Query("AdminTable");
		
		Filter filter=new FilterPredicate("username",Query.FilterOperator.EQUAL,username);
		q.setFilter(filter);
		q.addSort("username");
		
		String dPass=null;
		PreparedQuery pq = ds.prepare(q);
		for(Entity result : pq.asIterable()){
			dPass = result.getProperty("password").toString();
		}
		
		if(password.equals(dPass)){
			
			HttpSession session = request.getSession();
			session.setAttribute("admin", username);
			session.setMaxInactiveInterval(30*60);
			
			Cookie userName = new Cookie("admin", username);
			userName.setMaxAge(30*60);
			response.addCookie(userName);
			
			rd.forward(request, response);
	       
		
		} else {
			response.getWriter().println("Unsuccessful LogIn");
		}
	}
}
