package com.admin.servlet;

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

@WebServlet("/update_doctor")
public class UpdateDoctor extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		response.setContentType("text/html");
		try
		{
			String fullName = request.getParameter("fullName");
			String dob = request.getParameter("dob");
			String qualification = request.getParameter("qualification");
			String specialist = request.getParameter("specialist");
			String email = request.getParameter("email");
			String mobno = request.getParameter("mobno");
			String password = request.getParameter("password");
			
			int id = Integer.parseInt(request.getParameter("id"));
			
			Doctor d = new Doctor(id,fullName,dob,qualification,specialist,email,mobno,password);
			
			DoctorDao dao = new DoctorDao(DBConnection.getConnection());
			
			HttpSession session = request.getSession();
			
			if(dao.updateDoctor(d))
			{
				session.setAttribute("sucMsg", "Doctor Sucessfully Update");
				response.sendRedirect("admin/doctor.jsp");
			}
			else
			{
				session.setAttribute("errMsg", "Doctor not Updated");
				response.sendRedirect("admin/doctor.jsp");
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
