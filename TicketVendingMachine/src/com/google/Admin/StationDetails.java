package com.google.Admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;

@SuppressWarnings("serial")
public class StationDetails extends HttpServlet {
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		response.setContentType("text/html");
		
		DatastoreService ds = DatastoreServiceFactory.getDatastoreService();
		
		RequestDispatcher rd = request.getRequestDispatcher("StationDetailsTable.jsp");
		
		String buttontypeOne=request.getParameter("AddSbutton");
		String buttontypeTwo=request.getParameter("ModifySbutton");
		
		 if(buttontypeOne!=null){	
			   int sId = Integer.parseInt(request.getParameter("AddSid"));
			   String sName = request.getParameter("AddSname");
			   String sCity = request.getParameter("AddScity");
			   String sStationMaster = request.getParameter("AddSstationmaster");
			   String keystationdetails = "879075228"+sId;
			
			   Entity stationdetails = new Entity("StationDetailsTable",keystationdetails);
			   
			   stationdetails.setProperty("id",sId);
			   stationdetails.setProperty("name",sName);
			   stationdetails.setProperty("city",sCity);
			   stationdetails.setProperty("stationmaster",sStationMaster);
				
			 ds.put(stationdetails);
		   }
			else if(buttontypeTwo!=null){
				
				 int sId = Integer.parseInt(request.getParameter("ModifySid"));
				   String sName = request.getParameter("ModifySname");
				   String sCity = request.getParameter("ModifyScity");
				   String sStationMaster = request.getParameter("ModifySstationmaster");
				   String keystationdetails = "879075228"+sId;
				
					
				   Entity stationdetails = new Entity("StationDetailsTable",keystationdetails);
				   
				   stationdetails.setProperty("id",sId);
				   stationdetails.setProperty("name",sName);
				   stationdetails.setProperty("city",sCity);
				   stationdetails.setProperty("stationmaster",sStationMaster);
					
				 ds.put(stationdetails);
						 
			
			   }
		   rd.forward(request, response);
		   
	}

}
