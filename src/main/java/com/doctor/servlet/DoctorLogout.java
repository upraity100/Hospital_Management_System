package com.doctor.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/doctor_logout")
public class DoctorLogout extends HttpServlet 
{
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		response.setContentType("text/html");
		try
		{
			HttpSession session = request.getSession();
			session.removeAttribute("docObj");
			session.setAttribute("sucMsg", "Doctor Logout Sucessfuly");
			response.sendRedirect("doctor_login.jsp");
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
