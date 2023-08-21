package com.doctor.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.conn.DBConnection;
import com.dao.DoctorDao;
import com.model.Doctor;

@WebServlet("/doctor_servlet")
public class DoctorServlet extends HttpServlet 
{
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		response.setContentType("text/html");
		try
		{
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			
			HttpSession session = request.getSession();
			
			DoctorDao dao = new DoctorDao(DBConnection.getConnection());
			Doctor d = dao.login(email, password);
			
			if(d != null)
			{
				session.setAttribute("docObj", d);
				response.sendRedirect("doctor/index.jsp");
			}
			else
			{
				session.setAttribute("errMsg", "Invalid User");
				response.sendRedirect("doctor_login.jsp");
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
}
