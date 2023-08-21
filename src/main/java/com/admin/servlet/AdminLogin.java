package com.admin.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.User;

@WebServlet("/admin_login")
public class AdminLogin extends HttpServlet
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
			
			if("gaurav@gmail.com".equals(email) && "1234".equals(password))
			{
				session.setAttribute("adminObj", new User());
				session.setAttribute("sucMsg", "Sucessfuly Login");
				response.sendRedirect("admin/index.jsp");
			}
			else
			{
				session.setAttribute("errMsg", "Invalid User");
				response.sendRedirect("admin_login.jsp");
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
