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

@WebServlet("/user_register")
public class UserRegister extends HttpServlet
{
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
				doPost(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		response.setContentType("text/html");
		try(PrintWriter out = response.getWriter())
		{
			String fullName = request.getParameter("fullname");
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			
			User user = new User(fullName,email,password);
			
			UserDao dao = new UserDao(DBConnection.getConnection());
			
			HttpSession session = request.getSession();
			
			boolean result = dao.userRegister(user);
			if(result)
			{
				session.setAttribute("sucMsg", "Registerd Sucessfully");
				response.sendRedirect("user_login.jsp");
			}
			else
			{
				session.setAttribute("errMsg", "Something went's wrong");
				response.sendRedirect("signup.jsp");

			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
