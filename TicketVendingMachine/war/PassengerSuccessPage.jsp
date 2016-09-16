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
String passengerName=null;%>

<%
if(session.getAttribute("user") == null){
	response.sendRedirect("PassengerLogIn.html");
}else passengerName = (String) session.getAttribute("user");
String userName = null;
String sessionID = null;
Cookie[] cookies = request.getCookies();
if(cookies !=null){
for(Cookie cookie : cookies){
	if(cookie.getName().equals("puser")) userName = cookie.getValue();
	if(cookie.getName().equals("JSESSIONID")) sessionID = cookie.getValue();
}
}
name = passengerName.toUpperCase();
 %>
 
 
 <nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <ul class="nav navbar-nav">
      <li class="active"><a href="PassengerSuccessPage.jsp">Home</a></li>
      <li><a href="LoggedInTrainScheduleTable.jsp">Train Schedule</a></li>
      <li><a href="LoggedInTicketInformationTable.jsp">Ticket Details</a></li> 
    </ul>
    <ul class="nav navbar-nav navbar-right">
    <li><a href="PassengerTravelHistoryTable.jsp"><span class="glyphicon glyphicon-th"></span>PassengerTravelHistoryTable</a>
      <li><a href="BuyingTicket.jsp"><span class="glyphicon glyphicon-briefcase"></span> Buy Ticket </a></li>
      <li><a href="passengerlogout"><span class="glyphicon glyphicon-log-out"></span> <%= "LogOut : "+"'"+name+"'" %></a></li>
    </ul>
  </div>
</nav>
 
 <div class="container-fluid sect container-with-centered-content">
 <h1>WELCOME <%= name %></h1>
 </div>
 
</body>
</html>