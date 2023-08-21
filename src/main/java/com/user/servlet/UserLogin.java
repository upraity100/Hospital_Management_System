package com.user.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.conn.DBConnection;
import com.dao.UserDao;
import com.model.User;

@WebServlet("/user_login")
public class UserLogin extends HttpServlet
{
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		response.setContentType("text/html");
		try(PrintWriter pw = response.getWriter())
		{
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			
			HttpSession session = request.getSession();
			
			UserDao dao = new UserDao(DBConnection.getConnection());
			User user = dao.login(email, password);
			
			if(user != null)
			{
				session.setAttribute("userObj", user);
				response.sendRedirect("index.jsp");
			}
			else
			{
				session.setAttribute("errMsg", "Invalid User");
				response.sendRedirect("user_login.jsp");
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
