package com.google.Passenger;

import java.io.IOException;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;

@SuppressWarnings("serial")
public class UpdateInformation extends HttpServlet {
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		response.setContentType("text/plain");
			
		String cName = request.getParameter("Mname");
		String cMobile = request.getParameter("Mmobile");
		String cEmail = request.getParameter("Memail");
		String cPassword = request.getParameter("Mpassword");
		String cAge = request.getParameter("Mage");
		
		DatastoreService ds = DatastoreServiceFactory.getDatastoreService();
		Date date = new Date();

		Entity passengerdetail = new Entity("PassengerDetailsTable");
		passengerdetail.setProperty("name",cName);
		passengerdetail.setProperty("mobileno",cMobile);
		passengerdetail.setProperty("emailid",cEmail);
		passengerdetail.setProperty("password",cPassword);
		passengerdetail.setProperty("age",cAge);
		passengerdetail.setProperty("date",date.toString());
		
		ds.put(passengerdetail);
		
		RequestDispatcher rd = request.getRequestDispatcher("PassengerLogIn.html");
		
		rd.forward(request, response);
		
	}
}
