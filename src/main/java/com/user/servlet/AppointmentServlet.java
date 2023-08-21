package com.user.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.conn.DBConnection;
import com.dao.AppointmentDao;
import com.model.Appointment;

@WebServlet("/appointment")
public class AppointmentServlet extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		response.setContentType("text/html");
		try
		{
			int userId = Integer.parseInt(request.getParameter("userId"));
			String fullName = request.getParameter("fullname");
			String gender = request.getParameter("gender");
			String age = request.getParameter("age");
			String appointDate = request.getParameter("appointDate");
			String email = request.getParameter("email");
			String phno = request.getParameter("phno");
			String diseases = request.getParameter("diseases");
			int doctorId = Integer.parseInt(request.getParameter("doctorId"));
			String address = request.getParameter("address");
			
			Appointment ap = new Appointment(userId,fullName,gender,age,appointDate,email,phno,diseases,doctorId,address,"Pending");
			AppointmentDao dao = new AppointmentDao(DBConnection.getConnection());
			HttpSession session = request.getSession();
			
			if(dao.addAppointment(ap))
			{
				session.setAttribute("sucMsg", "Appointment Sucessfully");
				response.sendRedirect("user_appointment.jsp");
			}
			else
			{
				session.setAttribute("errMsg", "Something went wrong");
				response.sendRedirect("user_appointment.jsp");
			}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
