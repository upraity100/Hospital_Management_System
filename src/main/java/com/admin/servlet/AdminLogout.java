package com.admin.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/admin_logout")
public class AdminLogout extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		response.setContentType("text/html");
		try(PrintWriter out = response.getWriter())
		{
			HttpSession session = request.getSession();
			session.removeAttribute("adminObj");
			session.setAttribute("sucMsg", "Admin Logout Sucessfully");
			response.sendRedirect("admin_login.jsp");
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
