package com.google.Passenger;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.PreparedQuery;
import com.google.appengine.api.datastore.Query;
import com.google.appengine.api.datastore.Query.Filter;
import com.google.appengine.api.datastore.Query.FilterPredicate;

@SuppressWarnings("serial")
public class SendEmail extends HttpServlet {
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		resp.setContentType("text/html");
		PrintWriter out = resp.getWriter();
				
		String name= req.getParameter("username");
		
		Properties props = new Properties();
		Session session = Session.getDefaultInstance(props, null);
		String subject="Your Recovered Password";
		
		DatastoreService ds = DatastoreServiceFactory.getDatastoreService();
		
		Query q = new Query("PassengerDetailsTable");
		
		Filter filter=new FilterPredicate("name",Query.FilterOperator.EQUAL,name);
		q.setFilter(filter);
		q.addSort("name");
		String password="";
		String emailid = null;
		PreparedQuery pq = ds.prepare(q);
		for(Entity result: pq.asIterable()){
			password = result.getProperty("password").toString();
			emailid = result.getProperty("emailid").toString();
		}
		String body = "Your Password is "+" "+password;
		
		try{
			Message msg = new MimeMessage(session);
			msg.setFrom(new InternetAddress("recovery@ticketvending.appspotmail.com","AV Ltd."));
			msg.addRecipient(Message.RecipientType.TO,new InternetAddress(emailid,name));
			msg.setSubject(subject);
			msg.setText(body);
			Transport.send(msg);
		} catch (Exception e){
			out.println("Not a Valid Email Address");
		}
		resp.sendRedirect("SentEmailMessagePage.html");
	}

}
