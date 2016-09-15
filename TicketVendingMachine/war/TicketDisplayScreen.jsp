<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Ticket Successfully Booked</title>
<style type="text/css">
.container-with-centered-content {
  display: flex;
  align-items: center;
  justify-content: center;
}
</style>
</head>
<body>
<%! String ticket=null; %>

<% ticket = request.getAttribute("ticketNumber").toString();%>

<h1 class="container-with-centered-content">TICKET NUMBER: <%= ticket %></h1>
</body>
</html>