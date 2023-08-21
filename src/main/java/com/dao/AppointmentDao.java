package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.model.Appointment;

public class AppointmentDao 
{
	private Connection con;

	public AppointmentDao(Connection con) 
	{
		super();
		this.con = con;
	}
	public boolean addAppointment(Appointment a)
	{
		boolean b = false;
		try
		{
			String sql = "insert into appointment(userId,fullName,gender,age,appointDate,email,phNo,diseases,doctorId,address,status) values(?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement ps = con.prepareStatement(sql);
			
			ps.setInt(1, a.getUserId());
			ps.setString(2, a.getFullName());
			ps.setString(3, a.getGender());
			ps.setString(4, a.getAge());
			ps.setString(5, a.getAppointDate());
			ps.setString(6, a.getEmail());
			ps.setString(7, a.getPhNo());
			ps.setString(8, a.getDiseases());
			ps.setInt(9, a.getDoctorId());
			ps.setString(10, a.getAddress());
			ps.setString(11, a.getStatus());
			
			int result = ps.executeUpdate();
			if(result==1)
			{
				b = true;
			}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return b;
	}
	
	public List<Appointment> getAllAppointmentByLoginUser(int userId)
	{
		List<Appointment> list = new ArrayList<Appointment>();
		Appointment ap = null;
		try
		{
			String sql = "select * from appointment where userId=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, userId);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				ap = new Appointment();
				ap.setId(rs.getInt(1));
				ap.setUserId(rs.getInt(2));
				ap.setFullName(rs.getString(3));
				ap.setGender(rs.getString(4));
				ap.setAge(rs.getString(5));
				ap.setAppointDate(rs.getString(6));
				ap.setEmail(rs.getString(7));
				ap.setPhNo(rs.getString(8));
				ap.setDiseases(rs.getString(9));
				ap.setDoctorId(rs.getInt(10));
				ap.setAddress(rs.getString(11));
				ap.setStatus(rs.getString(12));
				list.add(ap);
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}

	public List<Appointment> getAllAppointmentByDoctorLogin(int doctorId)
	{
		List<Appointment> list = new ArrayList<Appointment>();
		Appointment ap = null;
		try
		{
			String sql = "select * from appointment where doctorId=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, doctorId);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				ap = new Appointment();
				ap.setId(rs.getInt(1));
				ap.setUserId(rs.getInt(2));
				ap.setFullName(rs.getString(3));
				ap.setGender(rs.getString(4));
				ap.setAge(rs.getString(5));
				ap.setAppointDate(rs.getString(6));
				ap.setEmail(rs.getString(7));
				ap.setPhNo(rs.getString(8));
				ap.setDiseases(rs.getString(9));
				ap.setDoctorId(rs.getInt(10));
				ap.setAddress(rs.getString(11));
				ap.setStatus(rs.getString(12));
				list.add(ap);
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}
	
	public Appointment getAppointmentById(int id)
	{
		Appointment ap = null;
		try
		{
			String sql = "select * from appointment where id=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				ap = new Appointment();
				ap.setId(rs.getInt(1));
				ap.setUserId(rs.getInt(2));
				ap.setFullName(rs.getString(3));
				ap.setGender(rs.getString(4));
				ap.setAge(rs.getString(5));
				ap.setAppointDate(rs.getString(6));
				ap.setEmail(rs.getString(7));
				ap.setPhNo(rs.getString(8));
				ap.setDiseases(rs.getString(9));
				ap.setDoctorId(rs.getInt(10));
				ap.setAddress(rs.getString(11));
				ap.setStatus(rs.getString(12));
				
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return ap;
	}
	
	public boolean updateCommentStatus(int id,int doctorId,String comm)
	{
		boolean f = false;
		try
		{
			String sql = "update appointment set status=? where id=? and doctorId=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, comm);
			ps.setInt(2, id);
			ps.setInt(3, doctorId);
			
			int i = ps.executeUpdate();
			if(i==1)
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
	
	public List<Appointment> getAllAppointment()
	{
		List<Appointment> list = new ArrayList<Appointment>();
		Appointment ap = null;
		try
		{
			String sql = "select * from appointment order by id desc";
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				ap = new Appointment();
				ap.setId(rs.getInt(1));
				ap.setUserId(rs.getInt(2));
				ap.setFullName(rs.getString(3));
				ap.setGender(rs.getString(4));
				ap.setAge(rs.getString(5));
				ap.setAppointDate(rs.getString(6));
				ap.setEmail(rs.getString(7));
				ap.setPhNo(rs.getString(8));
				ap.setDiseases(rs.getString(9));
				ap.setDoctorId(rs.getInt(10));
				ap.setAddress(rs.getString(11));
				ap.setStatus(rs.getString(12));
				list.add(ap);
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}

}
