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
<title>Passenger Details</title>
</head>
<body>

<% 
DatastoreService ds = DatastoreServiceFactory.getDatastoreService();
Query q = new Query("PassengerDetailsTable");
q.addSort("date",SortDirection.ASCENDING);
PreparedQuery pq = ds.prepare(q);  
 %>
 
<div class="container-fluid">
<table class="table table-bordered  table-condensed table-response">
<tr align="center">
<td colspan="5" align="center"><h2>Passenger Details</h2></td>
</tr>
 <tr>
          <th>Name</th>
          <th>Mobile No.</th> 
          <th>Email Id</th> 
          <th>Age</th> 
          <th>Date</th> 
</tr>
   <% for(Entity result: pq.asIterable()){ %>
  <tr>
            <td> <%= result.getProperty("name")  %></td>
            <td> <%= result.getProperty("mobileno")  %></td>
            <td> <%= result.getProperty("emailid")  %></td>
            <td> <%= result.getProperty("age")  %></td>
            <td> <%= result.getProperty("date")  %></td>
 </tr>
     <% } %> 
</TABLE>
<a class="btn btn-primary" href="AdministratorSuccessPage.jsp" role="button">Back to HomePage</a>
</div>
</body>
</html>