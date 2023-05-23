package Controller;

import java.io.IOException;
import java.time.LocalDate;
import java.time.Period;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.TrainDao;
import dao.UserDao;
import Dto.Train;
import Dto.TrainTicket;
import Dto.User;

@WebServlet("/cancelticket")
public class CancelTicket extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		User user = (User) req.getSession().getAttribute("user");
		if (user == null) {
			resp.getWriter().print("<h1 style='color:red'>Session Expired Login Again</h1>");
			req.getRequestDispatcher("Home.html").include(req, resp);
		} else {
			int pnr=Integer.parseInt(req.getParameter("pnr"));
			TrainDao dao=new TrainDao();
			TrainTicket ticket=dao.fetchTicket(pnr);
			if(ticket==null)
			{
				resp.getWriter().print("<h1 style='color:red'>Invalid PNR Number</h1>");
				req.getRequestDispatcher("UserHome.html").include(req, resp);
			}
			else {
				if(Period.between(LocalDate.now(), ticket.getDateOfJourney().toLocalDate()).getDays()<=0)
				{
					resp.getWriter().print("<h1 style='color:red'>You can not cancel this ticket</h1>");
					req.getRequestDispatcher("UserHome.html").include(req, resp);
				}
				else {
					ticket.setStatus("Cancelled");
					Train train=dao.fetch(ticket.getTrainNumber());
					train.setSeat(train.getSeat()+ticket.getNumberOfSeats());
					
					user.setWallet(user.getWallet()+ticket.getAmount());
					UserDao dao2=new UserDao();
					dao2.update(user);
					dao.update(train);
					dao.update(ticket);
					
					resp.getWriter().print("<h1>Ticket Cancelled Successfull</h1>");
					req.getRequestDispatcher("Home.html").include(req, resp);
					
				}
			}
		}
	}
}