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
background-color: #696969;
}
th,h2,td{
color: white;
}
</style>
</head>
<body>
<% 
        DatastoreService ds = DatastoreServiceFactory.getDatastoreService();
        Query q = new Query("TrainScheduleTable");
       PreparedQuery pq = ds.prepare(q);         
 %>
<div class="container-fluid">
<table class="table table-bordered  table-condensed table-response">
<tr>
<td colspan="4" align="center"><h2>TRAIN SCHEDULE</h2></td>
</tr>
 <TR>
          <th>Station Name</th>
           <th>Arrival Time</th>
            <th>Departure Time</th>
             <th>Day</th>         
 </TR>
   <% for(Entity result: pq.asIterable()){%>
  <TR>
            <TD> <%= result.getProperty("stationName").toString() %></td>
            <TD> <%= result.getProperty("arrivalTime").toString() %></TD>
            <TD> <%= result.getProperty("departureTime").toString() %></TD>
            <TD> <%= result.getProperty("day").toString() %></TD>            
 </TR>
     <% } %> 
</table>
<a class="btn btn-primary" href="Homepage.html" role="button">Back to HomePage</a>
</div>
</body>
</html>