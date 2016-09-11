package com.google.Admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;

@SuppressWarnings("serial")
public class TrainSchedule extends HttpServlet {
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		response.setContentType("text/html");
		
		DatastoreService ds = DatastoreServiceFactory.getDatastoreService();
		
		RequestDispatcher rd = request.getRequestDispatcher("TrainScheduleTable.jsp");
		
		String buttontypeOne=request.getParameter("AddTSbutton");
		String buttontypeTwo=request.getParameter("ModifyTSbutton");
		
		 if(buttontypeOne!=null){	
			   String tStationName = request.getParameter("AddTSstationname");
			   String tArrivalTime = request.getParameter("AddTSarrivaltime");
			   String tDepartureTime = request.getParameter("AddTSdeparturetime");
			   String tDay = request.getParameter("AddTSday"); 
			   String keytrainschedule = "8790"+tStationName;
			
			   Entity trainschedule = new Entity("TrainScheduleTable",keytrainschedule);
			   
			   trainschedule.setProperty("stationName",tStationName);
			   trainschedule.setProperty("arrivalTime",tArrivalTime);
			   trainschedule.setProperty("departureTime",tDepartureTime);
			   trainschedule.setProperty("day",tDay);
			  
			 ds.put(trainschedule);
		   }
			else if(buttontypeTwo!=null){
				
				 String tStationName = request.getParameter("ModifyTSstationname");
				   String tArrivalTime = request.getParameter("ModifyTSarrivaltime");
				   String tDepartureTime = request.getParameter("ModifyTSdeparturetime");
				   String tDay = request.getParameter("ModifyTSday"); 
				   String keytrainschedule = "8790"+tStationName;
				
				   Entity trainschedule = new Entity("TrainScheduleTable",keytrainschedule);
				   
				   trainschedule.setProperty("stationName",tStationName);
				   trainschedule.setProperty("arrivalTime",tArrivalTime);
				   trainschedule.setProperty("departureTime",tDepartureTime);
				   trainschedule.setProperty("day",tDay);
				  
				 ds.put(trainschedule);
						 
			
			   }
		   rd.forward(request, response);
		   
	}

}
