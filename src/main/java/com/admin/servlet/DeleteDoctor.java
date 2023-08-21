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

@WebServlet("/delete_doctor")
public class DeleteDoctor extends HttpServlet 
{
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		int id = Integer.parseInt(request.getParameter("id"));
		
		DoctorDao dao = new DoctorDao(DBConnection.getConnection());
		
		HttpSession session = request.getSession();
		
		if(dao.deleteDoctor(id))
		{
			session.setAttribute("sucMsg", "Delete Doctor Sucessfully");
			response.sendRedirect("admin/doctor.jsp");
		}
		else
		{
			session.setAttribute("errMsg", "Doctor not Deleted");
			response.sendRedirect("admin/doctor.jsp");
		}
	}

}
