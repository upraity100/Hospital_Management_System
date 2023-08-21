package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.model.User;

public class UserDao 
{
	private Connection con;
	public UserDao(Connection con) 
	{
		super();
		this.con = con;
	}
	
	public boolean userRegister(User u)
	{
		boolean f = false;
		try
		{
			String query = "insert into user(full_name,email,password) values(?,?,?)";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, u.getFullName());
			ps.setString(2, u.getEmail());
			ps.setString(3, u.getPassword());
			
			int result = ps.executeUpdate();
			
			if(result==1)
			{
				f = true;
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return f;
	}
	
	public User login(String email, String password)
	{
		User u = null;
		try
		{
			String sql = "select * from user where email=? and password=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, email);
			ps.setString(2, password);
			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next())
			{
				u = new User();
				u.setId(rs.getInt(1));
				u.setFullName(rs.getString(2));
				u.setEmail(rs.getString(3));
				u.setPassword(rs.getString(4));
			}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return u;
	}
	
	public boolean checkOldPassword(int userId,String oldPassword)
	{
		boolean f = false;
		try
		{
			String sql = "select * from user where id=? and password=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, userId);
			ps.setString(2, oldPassword);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				f = true;
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return f;
	}
	
	public boolean checkNewPassword(int userId,String newPassword)
	{
		boolean f = false;
		try
		{
			String sql = "update user set password=? where id=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, newPassword);
			ps.setInt(2, userId);
			
			int result  = ps.executeUpdate();
			if(result==1)
			{
				f = true;
			}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return f;
	}
	
}
