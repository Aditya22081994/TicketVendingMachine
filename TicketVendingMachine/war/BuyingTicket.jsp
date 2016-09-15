<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title> Buy your Ticket</title>
</head>
<body>
<%! String name = null; 
String passenger=null; %>

<% if(session.getAttribute("user")==null){
	response.sendRedirect("PassengerLogIn.html");
     } else{
    	 passenger = session.getAttribute("user").toString();
    	 String userName = null;
    	 String sessionID = null;
    	 Cookie[] cookies = request.getCookies();
    	 if(cookies !=null){
    	 for(Cookie cookie : cookies){
    	 	if(cookie.getName().equals("puser")) userName = cookie.getValue();
    	 	if(cookie.getName().equals("JSESSIONID")) sessionID = cookie.getValue();
    	 }
    	 }
     }
%>
<div class="container-fluid">
<br><br><br>
  <h3><strong><b>TICKET BUYING FORM</b></strong></h3>
  <br>
  <form class="form-horizontal" role="form" method="post" action="buyingticket">
   <div class="form-group">
      <label class="control-label col-sm-2 white" for="text">Source</label>
      <div class="col-sm-3">
      <select class="form-control" name="Csource">
          <option>Select Source</option>
         <option>Hyderabad</option>
        <option>Mumbai</option>
        <option>Delhi</option>
       </select>
      </div>
    </div>
       <div class="form-group">
      <label class="control-label col-sm-2 white" for="text">Destination</label>
      <div class="col-sm-3">
      <select class="form-control" name="Cdestination">
          <option>Select Destination</option>
         <option>Hyderabad</option>
        <option>Mumbai</option>
        <option>Delhi</option>
       </select>
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2 white" for="text">Date</label>
      <div class="col-sm-3">
        <input type="text" class="form-control" name="Cdate" placeholder="DDMMYYYY" required>
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2 white" for="text">Time</label>
      <div class="col-sm-3">
        <input type="text" class="form-control" name="Ctime" placeholder="Enter Time" required>
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2 white" for="text">Train no.</label>
      <div class="col-sm-3">
       <select class="form-control" name="Ctrainnumber">
          <option>Select Train Number</option>
         <option>1</option>
        <option>2</option>
        <option>3</option>
       </select>
      </div>
    </div>
     <div class="form-group">
      <label class="control-label col-sm-2 white" for="text">Station No.</label>
      <div class="col-sm-3">
       <select class="form-control" name="Cstationnumber">
          <option>Select Station Number</option>
         <option>1</option>
        <option>2</option>
        <option>3</option>
       </select>
      </div>
    </div>
     <div class="form-group">
      <label class="control-label col-sm-2 white" for="text">Price</label>
      <div class="col-sm-3">
        <input type="text" class="form-control" name="Cprice" placeholder="Enter " required>
      </div>
    </div>
     <div class="form-group">
      <label class="control-label col-sm-2 white" for="text">Seat Number</label>
      <div class="col-sm-3">
        <input type="text" class="form-control" name="Cseatnumber" placeholder="Enter Seat Number" required>
      </div>
    </div>
     <div class="form-group">
      <label class="control-label col-sm-2 white" for="text">Boggy Number</label>
      <div class="col-sm-3">
       <select class="form-control" name="Cboggynumber">
          <option>Select Boggy Number</option>
         <option>1</option>
        <option>2</option>
        <option>3</option>
       </select>
      </div>
    </div>
  
           <div class="form-group">
      <div class="col-sm-offset-2 col-sm-10">
        <button type="submit" class="btn btn-success">Book Ticket</button>
      </div>
    </div>
  </form>
  </div>
</body>
</html>