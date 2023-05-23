<%@page import="java.util.Arrays"%>
<%@page import="Dto.Train"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Fetch Railway Info</title>
</head>
<body>
<%List<Train> list=(List<Train>)request.getAttribute("list"); %>

<table border="1">
<tr>
<th>Train Number</th>
<th>Train Name</th>
<th>From Station</th>
<th>To Station</th>
<th>Stations</th>
<th>Time of Departure</th>
<th>Time of Arrival</th>
<th>Ticket Price</th>
<th>Available Days</th>
<th>Delete</th>
<th>Edit</th>
</tr>

<%for(Train train:list){ %>
<tr>
<th><%=train.getNumber() %></th>
<th><%=train.getName() %></th>
<th><%=train.getStations()[0] %></th>
<th><%=train.getStations()[train.getStations().length-1] %></th>
<th><%=Arrays.toString(train.getStations()) %></th>
<th><%=train.getTime()[0] %></th>
<th><%=train.getTime()[train.getTime().length-1] %></th>
<th><%=Arrays.toString(train.getPrice()) %></th>
<th><%=Arrays.toString(train.getDays()) %></th>
<th><a href="deletetrain?number=<%=train.getNumber()%>"><button>Delete</button></a></th>
<th><a href="EditTrain.jsp?number=<%=train.getNumber()%>"><button>Edit</button></a></th>
</tr>
<%} %>
</table>
<br>
<a href="ManagementHome.html"><button>Back</button></a>
</body>
</html>