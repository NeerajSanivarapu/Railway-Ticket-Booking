<%@page import="Dto.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cancel Ticket</title>
</head>
<body>
	<%
	User user = (User) session.getAttribute("user");
	%>
	<%
	if (user == null) {
		response.getWriter().print("<h1 style='color:red'>Session Expired login again</h1>");
		request.getRequestDispatcher("Login.html").include(request, response);
	} else {
	%>
	<form action="cancelticket">
		Enter PNR Number: <input type="number" name="pnr"> <br>
		<button>Cancel Ticket</button>
	</form>
	<br>
	<br>
	<a href="UserHome.html"><button>Back</button></a>
	<%
	}
	%>
</body>
</html>