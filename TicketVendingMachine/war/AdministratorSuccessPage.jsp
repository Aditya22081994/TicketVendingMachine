<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>WELCOME</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style type="text/css">
html,body{
	height: 100%;	
	background-color: #696969;
}
.container-with-centered-content {
  display: flex;
  align-items: center;
  justify-content: center;
}
.sect{
	height: 85%;
		background-size: cover; 
	background-repeat: no-repeat;
}
h1{
	color: #fff;
	line-height: 100%;
	text-align: center;
	font-size: 55px;
	font-family: verdana;
}
</style>
</head>
<body>
<%! String name = null; 
String administratorName=null;%>

<%
if(session.getAttribute("admin") == null){
	response.sendRedirect("AdministratorLogIn.html");
}else administratorName = (String) session.getAttribute("admin");
String userName = null;
String sessionID = null;
Cookie[] cookies = request.getCookies();
if(cookies !=null){
for(Cookie cookie : cookies){
	if(cookie.getName().equals("puser")) userName = cookie.getValue();
	if(cookie.getName().equals("JSESSIONID")) sessionID = cookie.getValue();
}
}
name = administratorName.toUpperCase();
 %>
 
 <nav class="navbar navbar-inverse">
  <div class="container-fluid">
  
    <ul class="nav navbar-nav">
      <li class="active"><a href="AdministratorSuccessPage.jsp">Home</a></li>
      <li><a href="TrainScheduleTable.jsp">Train Schedule</a></li>
       <li><a href="TicketInformationTable.jsp">Ticket Information</a></li> 
      
    </ul>
    
    <ul class="nav navbar-nav navbar-right">

          <li><a href="PassengerDetailsTable.jsp">Passenger Details</a></li>
 
          <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Train Information <span class="caret"></span></a>
    <ul class="dropdown-menu">
          <li><a href="TrainDetailsTable.jsp">Train Details</a></li>
          <li><a href="SeatInformationTable.jsp">Seat Information</a></li>
        </ul>
        
          <li><a href="StationDetailsTable.jsp">Station Details</a></li>
          
          <li><a href="administratorlogout"><span class="glyphicon glyphicon-log-out"></span><%= "LogOut : "+"'"+name+"'" %></a></li>
         </ul>
  </div>
</nav>

<div class="container-fluid sect container-with-centered-content">
 <h1>WELCOME <%= name %></h1>
 </div>

</body>
</html>