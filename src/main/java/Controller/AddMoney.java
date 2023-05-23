package Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDao;
import Dto.User;

@WebServlet("/addmoney")
public class AddMoney extends HttpServlet
{
@Override
protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	User user=(User) req.getSession().getAttribute("user");
	if(user==null)
	{
		resp.getWriter().print("<h1 style='color:red'>Session Expired Login Again</h1>");
		req.getRequestDispatcher("Home.html").include(req, resp);
	}
	else {
	user.setWallet(user.getWallet()+Double.parseDouble(req.getParameter("amount")));
	UserDao dao=new UserDao();
	dao.update(user);
	
	resp.getWriter().print("<h1 style='color:green'>Money Added to Wallet</h1>");
	req.getRequestDispatcher("UserHome.html").include(req, resp);
	
	}
}
}