<%@page import="com.google.appengine.api.datastore.Query"%>
<%@page import="com.google.appengine.api.datastore.*"%>
<%@page import="com.google.appengine.api.datastore.Query.FilterPredicate"%>
<%@page import="com.google.appengine.api.datastore.Query.Filter"%>
<%@page import="com.google.appengine.api.datastore.Query.SortDirection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html lang="en"	>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Station Details</title>
<style type="text/css">
body{
background-color: black;
}
th,h2,td{
color: white;
}
</style>
</head>
<body>
<%! String passenger = null;
        String tablename=null;
%>
<% if(session.getAttribute("user")==null){
	response.sendRedirect("PassengerLogIn.html");
     } else{
    	 passenger = session.getAttribute("user").toString();
    	tablename = passenger+"TravelHistoryTable";
     }
%>
<% 
        DatastoreService ds = DatastoreServiceFactory.getDatastoreService();
        Query q = new Query(tablename);
       q.addSort("Date",SortDirection.ASCENDING);
       PreparedQuery pq = ds.prepare(q);         
 %>
<div class="container-fluid">
<table class="table table-bordered  table-condensed table-response">
<tr>
<td colspan="9" align="center"><h2>TRAVEL HISTORY</h2></td>
</tr>
 <TR>
          <th>Source</th>
          <th>Destination</th>
          <th>Date</th>
          <th>Time</th>
          <th>Train Number</th>
          <th>Station Number</th>
          <th>Price</th>
          <th>Seat Number</th>
          <th>Boggy Number</th>
 </TR>
   <% for(Entity result: pq.asIterable()){%>
  <TR>
            <TD> <%= result.getProperty("Source") %></td>
            <TD> <%= result.getProperty("Destination") %></td>
            <TD> <%= result.getProperty("Date") %></td>
            <TD> <%= result.getProperty("Time") %></td>
            <TD> <%= result.getProperty("TrainNumber") %></td>
            <TD> <%= result.getProperty("StationNumber") %></td>
            <TD> <%= result.getProperty("Price") %></td>
            <TD> <%= result.getProperty("SeatNumber") %></td>
            <TD> <%= result.getProperty("BoggyNumber") %></td>
 </TR>
     <% } %> 
</table>
<a class="btn btn-primary" href="PassengerSuccessPage.jsp" role="button">Back to HomePage</a>
</div>
</body>
</html>