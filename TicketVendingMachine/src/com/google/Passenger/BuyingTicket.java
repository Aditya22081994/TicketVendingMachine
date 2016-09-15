package com.google.Passenger;

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
import com.google.appengine.api.datastore.Query.SortDirection;

@SuppressWarnings("serial")
public class BuyingTicket extends HttpServlet {
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		response.setContentType("text/html");
		
		DatastoreService ds = DatastoreServiceFactory.getDatastoreService();
		
		RequestDispatcher rd = request.getRequestDispatcher("TicketDisplayScreen.jsp");
		
		String source=request.getParameter("Csource");
		String destination=request.getParameter("Cdestination");
		String date= request.getParameter("Cdate");
		String time= request.getParameter("Ctime");
		int trainnumber= Integer.parseInt(request.getParameter("Ctrainnumber"));
		int stationnumber= Integer.parseInt(request.getParameter("Cstationnumber"));
		int price= Integer.parseInt(request.getParameter("Cprice"));
		int seatnumber= Integer.parseInt(request.getParameter("Cseatnumber"));
		int boggynumber= Integer.parseInt(request.getParameter("Cboggynumber"));
		
		HttpSession session = request.getSession();
		String name = session.getAttribute("user").toString();
		
		// Code to Save the Travel History of the Passenger in his table
		String tablename = name+"TravelHistoryTable";
				
		Entity travelhistory = new Entity(tablename);
		travelhistory.setProperty("Source",source);
		travelhistory.setProperty("Destination",destination);
		travelhistory.setProperty("Date",date);
		travelhistory.setProperty("Time",time);
		travelhistory.setProperty("TrainNumber",trainnumber);
		travelhistory.setProperty("StationNumber",stationnumber);
		travelhistory.setProperty("Price",price);
		travelhistory.setProperty("SeatNumber",seatnumber);
		travelhistory.setProperty("BoggyNumber",boggynumber);
		ds.put(travelhistory);
		
		// Code to Update the Seat Information when the ticket is bought
		
		Query q = new Query("SeatInformationTable");
		Filter filter=new FilterPredicate("boggyNumber",Query.FilterOperator.EQUAL,boggynumber);
		q.setFilter(filter);
		q.addSort("boggyNumber", SortDirection.ASCENDING);
		
		   String bType = null;
		   int bSeat = 0;
		       // Block to get the number of Seats in a particular boggy
		PreparedQuery pq = ds.prepare(q);
		for(Entity result : pq.asIterable()){
			bType = result.getProperty("boggyType").toString();
			bSeat = Integer.parseInt(result.getProperty("No.ofSeats").toString());
		}
		
		if(bSeat==0){
			response.sendRedirect("BuyingTicket.jsp");
               request.setAttribute("boggystatus",bSeat);
		} else{
		
		request.setAttribute("ticketNumber","T"+bSeat);
		int newSeat = bSeat-1;
		       // Block to update the new Seat Number
		   String keyseatinformation = "87905"+boggynumber;
		   Entity seatinformation = new Entity("SeatInformationTable",keyseatinformation);
		   seatinformation.setProperty("boggyNumber",boggynumber);
		   seatinformation.setProperty("boggyType",bType);
		   seatinformation.setProperty("No.ofSeats",newSeat);
		   ds.put(seatinformation);
		   
		}
		 rd.forward(request, response);
	}

}
