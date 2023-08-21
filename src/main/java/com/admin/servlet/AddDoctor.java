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


@WebServlet("/add_doctor")
public class AddDoctor extends HttpServlet 
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
			
			Doctor d = new Doctor(fullName,dob,qualification,specialist,email,mobno,password);
			
			DoctorDao dao = new DoctorDao(DBConnection.getConnection());
			
			HttpSession session = request.getSession();
			
			if(dao.addDoctor(d))
			{
				session.setAttribute("sucMsg", "Doctor Sucessfully Register");
				response.sendRedirect("admin/doctor.jsp");
			}
			else
			{
				session.setAttribute("errMsg", "Doctor not inserted");
				response.sendRedirect("admin/doctor.jsp");
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}


