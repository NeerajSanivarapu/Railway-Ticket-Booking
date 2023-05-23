<%@page import="java.util.Arrays"%>
<%@page import="Dto.Train"%>
<%@page import="dao.TrainDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Train</title>
</head>
<body>
	<%
	TrainDao dao = new TrainDao();
	Train train = dao.fetch(Integer.parseInt(request.getParameter("number")));
	%>

	<form action="updatetrain" method="post">
		Train Number: <input type="number" name="tnumber"
			value="<%=train.getNumber()%>" readonly="readonly"><br>
		Train Name: <input type="text" name="tname"
			value="<%=train.getName()%>"><br> Number of Seats: <input
			type="number" name="tseat" value="<%=train.getSeat()%>"><br>
		Stations:
		<textarea rows="5" cols="30" name="tstation"><%
			for (String station : train.getStations()) {
				out.print(station + ",");
			}
			%></textarea>
		<br> Ticket Price:
		<textarea rows="5" cols="30" name="tprice"><%
			for (String price : train.getPrice()) {
				out.print(price + ",");
			}
			%></textarea>
		<br> Time:
		<textarea rows="5" cols="30" name="ttime"><%
			for (String time : train.getTime()) {
				out.print(time + ",");
			}
			%></textarea>
		<br> Days:
		<textarea rows="5" cols="30" name="tday"><%
			for (String day : train.getDays()) {
				out.print(day + ",");
			}
			%></textarea>
		<br>
		<button type="reset">Cancel</button>
		<button>Update</button>
	</form>
	<br>
</body>
</html>