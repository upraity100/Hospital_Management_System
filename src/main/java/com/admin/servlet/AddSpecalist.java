package com.admin.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.conn.DBConnection;
import com.dao.SpecalistDao;
import com.model.User;

@WebServlet("/add_specalist")
public class AddSpecalist extends HttpServlet
{
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		response.setContentType("text/html");
		try
		{
			String specName = request.getParameter("specName");
			
			SpecalistDao dao = new SpecalistDao(DBConnection.getConnection());
			boolean result = dao.addSpecalist(specName);
			
			HttpSession session = request.getSession();
			
			if(result)
			{
				session.setAttribute("sucMsg", "Specalist added");
				response.sendRedirect("admin/index.jsp");
			}
			else
			{
				session.setAttribute("errMsg", "something went wrong");
				response.sendRedirect("admin_login.jsp");
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
}
