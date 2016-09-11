package com.google.Admin;

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
public class AdminValidation extends HttpServlet {
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setContentType("text/html");
		
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
			session.setAttribute("user", username);
			session.setMaxInactiveInterval(30*60);
			
			Cookie userName = new Cookie("user", username);
			userName.setMaxAge(30*60);
			response.addCookie(userName);
			
			response.getWriter().println("Success");
			response.sendRedirect("AdministratorSuccessPage.jsp");
	       
		
		} else {
			response.getWriter().println("Unsuccessful LogIn");
		}
	}
}
