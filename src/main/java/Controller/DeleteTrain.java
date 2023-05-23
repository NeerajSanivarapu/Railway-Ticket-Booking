package Controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.TrainDao;
import Dto.Train;

@WebServlet("/deletetrain")
public class DeleteTrain extends HttpServlet
{
@Override
protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	int tnumber=Integer.parseInt(req.getParameter("number"));
	
	TrainDao dao=new TrainDao();
	dao.delete(tnumber);
	
	List<Train> list = dao.fetchAll();

	if (list.isEmpty()) {
		resp.getWriter().print("<h1 style='color:red'>No Railway information Available</h1>");
		req.getRequestDispatcher("ManagementHome.html").include(req, resp);
	}
	else {
		resp.getWriter().print("<h1 style='color:blue'>Railway information deleted Successfully</h1>");
		req.setAttribute("list", list);
		req.getRequestDispatcher("FetchRailwayInfo.jsp").include(req, resp);
	}
}
}