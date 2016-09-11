package com.google.Admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;

@SuppressWarnings("serial")
public class TrainDetails extends HttpServlet {
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		response.setContentType("text/html");
		
		DatastoreService ds = DatastoreServiceFactory.getDatastoreService();
		
		RequestDispatcher rd = request.getRequestDispatcher("TrainDetailsTable.jsp");
		
		String buttontypeOne=request.getParameter("AddTbutton");
		String buttontypeTwo=request.getParameter("ModifyTbutton");
		
		 if(buttontypeOne!=null){	
			   int tId = Integer.parseInt(request.getParameter("AddTnumber"));
			   String tName = request.getParameter("AddTname");
			   String tSource = request.getParameter("AddTsource");
			   String tDestination = request.getParameter("AddTdestination");
			   String tDate = request.getParameter("AddTdate"); 
			   String tTime = request.getParameter("AddTtime"); 
			   String keytraindetails = "8790"+tId;
			
			   Entity traindetails = new Entity("TrainDetailsTable",keytraindetails);
			   
			   traindetails.setProperty("id",tId);
			   traindetails.setProperty("name",tName);
			   traindetails.setProperty("source",tSource);
			   traindetails.setProperty("destination",tDestination);
			   traindetails.setProperty("date",tDate);
			   traindetails.setProperty("time",tTime);
				
			 ds.put(traindetails);
		   }
			else if(buttontypeTwo!=null){
				
				 int tId = Integer.parseInt(request.getParameter("ModifyTnumber"));
				   String tName = request.getParameter("ModifyTname");
				   String tSource = request.getParameter("ModifyTsource");
				   String tDestination = request.getParameter("ModifyTdestination");
				   String tDate = request.getParameter("ModifyTdate"); 
				   String tTime = request.getParameter("ModifyTtime"); 
				   String keytraindetails = "8790"+tId;
				
				   Entity traindetails = new Entity("TrainDetailsTable",keytraindetails);
				   
				   traindetails.setProperty("id",tId);
				   traindetails.setProperty("name",tName);
				   traindetails.setProperty("source",tSource);
				   traindetails.setProperty("destination",tDestination);
				   traindetails.setProperty("date",tDate);
				   traindetails.setProperty("time",tTime);
					
				 ds.put(traindetails);
						 
			
			   }
		   rd.forward(request, response);
		   
	}

}
