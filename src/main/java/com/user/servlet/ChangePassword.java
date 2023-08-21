package com.user.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.conn.DBConnection;
import com.dao.UserDao;


@WebServlet("/Change_Password")
public class ChangePassword extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
			int userId = Integer.parseInt(request.getParameter("uid"));
			String oldPassword = request.getParameter("oldPassword");
			String newPassword = request.getParameter("newPassword");
			
			UserDao dao = new UserDao(DBConnection.getConnection());
			
			HttpSession session = request.getSession();
			if(dao.checkOldPassword(userId, oldPassword))
			{
				if(dao.checkNewPassword(userId, newPassword))
				{
					session.setAttribute("sucMsg", "Password Sucessfully Change");
					response.sendRedirect("change_password.jsp");
				}
				else
				{
					session.setAttribute("errMsg", "Password Cantnot Change");
					response.sendRedirect("change_password.jsp");
				}
			}
			else
			{
				session.setAttribute("errMsg", "Incorrect Old Password");
				response.sendRedirect("change_password.jsp");
			}
	}

}
