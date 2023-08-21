package com.doctor.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.conn.DBConnection;
import com.dao.AppointmentDao;


@WebServlet("/update_status")
public class UpdateStatus extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		try
		{
			int id = Integer.parseInt(request.getParameter("id"));
			int did = Integer.parseInt(request.getParameter("doctorId"));
			String comm = request.getParameter("comm");
			
			AppointmentDao dao = new AppointmentDao(DBConnection.getConnection());
			
			HttpSession session = request.getSession();
			if(dao.updateCommentStatus(id, did, comm))
			{
				session.setAttribute("sucMsg", "Comment Updated");
				response.sendRedirect("doctor/patient.jsp");
			}
			else
			{
				session.setAttribute("errMsg", "something went wrong");
				response.sendRedirect("doctor/patient.jsp");
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
