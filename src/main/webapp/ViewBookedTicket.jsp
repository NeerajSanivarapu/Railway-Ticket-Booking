<%@page import="Dto.TrainTicket"%>
<%@page import="java.util.List"%>
<%@page import="Dto.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View All Tickets</title>
</head>
<body>
<% User user=(User)session.getAttribute("user"); %>
<%if(user==null){
response.getWriter().print("<h1 style='color:red'>Session Expired login again</h1>");	
request.getRequestDispatcher("Login.html").include(request, response);
}
else{
%>
<%List<TrainTicket> list=user.getTickets(); 
if(list==null || list.isEmpty())
{
	response.getWriter().print("<h1 style='color:red'>No tickets Booked</h1>");	
	request.getRequestDispatcher("UserHome.html").include(request, response);
}
else{
%>
<table border="1">
<tr>
<th>PNR</th>
<th>Train Number</th>
<th>UserName</th>
<th>From</th>
<th>To</th>
<th>Number of Seats</th>
<th>Price</th>
<th>Date of Booking</th>
<th>Date of Journey</th>
<th>Status</th>
<th>Cancel</th>
</tr>
<%for(TrainTicket ticket:list){ %>
<tr>
<th><%=ticket.getPnr() %></th>
<th><%=ticket.getTrainNumber() %></th>
<th><%=user.getFirstName()+" "+user.getLastName() %></th>
<th><%=ticket.getSource() %></th>
<th><%=ticket.getDestination() %></th>
<th><%=ticket.getNumberOfSeats() %></th>
<th><%=ticket.getAmount() %></th>
<th><%=ticket.getDateOfBooking() %></th>
<th><%=ticket.getDateOfJourney() %></th>
<th><%=ticket.getStatus() %></th>
<th>
<%if(ticket.getStatus().equals("Booked")){ %>
<a href="cancelticket?pnr=<%=ticket.getPnr()%>"><button>Cancel</button></a>
<%}
else{
%>
<button disabled="disabled">Cancel</button>
<%} %>
</th>
</tr>
<%} %>
</table>
<%} }%>
<br>
<a href="UserHome.html"><button>Back</button></a>
</body>
</html>