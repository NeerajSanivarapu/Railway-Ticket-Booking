<%@page import="Dto.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Balance</title>
</head>
<body>
<% User user=(User)session.getAttribute("user"); %>
<%if(user==null){
response.getWriter().print("<h1 style='color:red'>Session Expired login again</h1>");	
request.getRequestDispatcher("Login.html").include(request, response);
}
else{
%>
<h1>The amount in Wallet is <%=user.getWallet() %></h1>
<%} %>
<br><br>
<a href="AddMoney.jsp"><button>Add money</button></a>
<br><br>
<a href="UserHome.html"><button>Back</button></a>
</body>
</html>