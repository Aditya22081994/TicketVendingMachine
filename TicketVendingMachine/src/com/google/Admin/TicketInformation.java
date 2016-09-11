package com.google.Admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;

@SuppressWarnings("serial")
public class TicketInformation extends HttpServlet {
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		response.setContentType("text/html");
		
		DatastoreService ds = DatastoreServiceFactory.getDatastoreService();
		
		RequestDispatcher rd = request.getRequestDispatcher("TicketInformationTable.jsp");
		
		String buttontypeOne=request.getParameter("AddTIbutton");
		String buttontypeTwo=request.getParameter("ModifyTIbutton");
		
		 if(buttontypeOne!=null){	
			   int tId = Integer.parseInt(request.getParameter("AddTItrainnumber"));
			   String tSourceStation = request.getParameter("AddTIsourcestation");
			   String tDestinationStation = request.getParameter("AddTIdestination");
			   int tPrice = Integer.parseInt(request.getParameter("AddTIprice"));
			  
			   String keyticketinformation = "879075"+tId;
			
			   Entity ticketinformation = new Entity("TicketInformationTable",keyticketinformation);
			   
			   ticketinformation.setProperty("TrainNumber",tId);
			   ticketinformation.setProperty("SourceStation", tSourceStation);
			   ticketinformation.setProperty("DestinationStation",tDestinationStation);
			   ticketinformation.setProperty("Price",tPrice);
						
			 ds.put(ticketinformation);
		   }
			else if(buttontypeTwo!=null){
				
				  int tId = Integer.parseInt(request.getParameter("ModifyTItrainnumber"));
				   String tSourceStation = request.getParameter("ModifyTIsourcestation");
				   String tDestinationStation = request.getParameter("ModifyTIdestination");
				   int tPrice = Integer.parseInt(request.getParameter("ModifyTIprice"));
				  
				   String keyticketinformation = "879075"+tId;
				
				   Entity ticketinformation = new Entity("TicketInformationTable",keyticketinformation);
				   
				   ticketinformation.setProperty("TrainNumber",tId);
				   ticketinformation.setProperty("SourceStation", tSourceStation);
				   ticketinformation.setProperty("DestinationStation",tDestinationStation);
				   ticketinformation.setProperty("Price",tPrice);
							
				 ds.put(ticketinformation);
						 
			
			   }
		   rd.forward(request, response);
		   
	}

}
