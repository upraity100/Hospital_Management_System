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

@WebServlet("/edit_doctor_profile")
public class Edit_Doctor_Profile extends HttpServlet 
{
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		try
		{
			String fullName = request.getParameter("fullName");
			String dob = request.getParameter("dob");
			String qualification = request.getParameter("qualification");
			String specialist = request.getParameter("specialist");
			String email = request.getParameter("email");
			String mobno = request.getParameter("mobno");
			
			int id = Integer.parseInt(request.getParameter("uid"));
			
			Doctor d = new Doctor(id,fullName,dob,qualification,specialist,email,mobno,"");
			
			DoctorDao dao = new DoctorDao(DBConnection.getConnection());
			
			HttpSession session = request.getSession();
			
			if(dao.editDoctorProfile(d))
			{
				Doctor doctorUpdate = dao.getDoctorById(id);
				session.setAttribute("docObj", doctorUpdate);
				session.setAttribute("sucMsg", "Doctor Sucessfully Update");
				response.sendRedirect("doctor/edit_profile.jsp");
			}
			else
			{
				session.setAttribute("errMsg", "Doctor not Updated");
				response.sendRedirect("doctor/edit_profile.jsp");
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
