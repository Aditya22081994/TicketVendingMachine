<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
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
 
 <a href="PassengerTravelHistoryTable.jsp">PassengerTravelHistoryTable</a><br>
 <a href="BuyingTicket.jsp">Buy Ticket</a>
 
 <a href="bankingofficerlogout"><%= "BankingOfficer : "+"'"+name+"'" %></a>
<h1>Successful Log In Passenger</h1>
</body>
</html>