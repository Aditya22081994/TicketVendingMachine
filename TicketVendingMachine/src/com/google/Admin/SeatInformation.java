package com.google.Admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;

@SuppressWarnings("serial")
public class SeatInformation extends HttpServlet {
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		response.setContentType("text/html");
		
		DatastoreService ds = DatastoreServiceFactory.getDatastoreService();
		
		RequestDispatcher rd = request.getRequestDispatcher("SeatInformationTable.jsp");
		
		String buttontypeOne=request.getParameter("AddSIbutton");
		String buttontypeTwo=request.getParameter("ModifySIbutton");
		
		 if(buttontypeOne!=null){	
			   int bId = Integer.parseInt(request.getParameter("AddSbogeynumber"));
			   String bType = request.getParameter("AddStype");
			   String bSeat = request.getParameter("AddSseat");
			  
			   String keyseatinformation = "87905"+bId;
			
			   Entity seatinformation = new Entity("SeatInformationTable",keyseatinformation);
			   
			   seatinformation.setProperty("boggyNumber",bId);
			   seatinformation.setProperty("boggyType",bType);
			   seatinformation.setProperty("No.ofSeats",bSeat);
					
			 ds.put(seatinformation);
		   }
			else if(buttontypeTwo!=null){
				
				   int bId = Integer.parseInt(request.getParameter("ModifySbogeynumber"));
				   String bType = request.getParameter("ModifyStype");
				   String bSeat = request.getParameter("ModifySseat");
				  
				   String keyseatinformation = "87905"+bId;
				
				   Entity seatinformation = new Entity("SeatInformationTable",keyseatinformation);
				   
				   seatinformation.setProperty("boggyNumber",bId);
				   seatinformation.setProperty("boggyType",bType);
				   seatinformation.setProperty("No.ofSeats",bSeat);
						
				 ds.put(seatinformation);
			
			   }
		   rd.forward(request, response);
		   
	}

}
