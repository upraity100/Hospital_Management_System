package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.model.Specalist;

public class SpecalistDao
{
	private Connection con;

	public SpecalistDao(Connection con)
	{
		super();
		this.con = con;
	}
	public boolean addSpecalist(String spec)
	{
		boolean f = false;
		try
		{
			String sql = "insert into Specalist(SpecalistName) values(?)";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, spec);
			
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
	
	public List<Specalist> getAllSpecalist()
	{
		List<Specalist> list = new ArrayList<Specalist>();
		Specalist s = null;
		try
		{
			String sql = "select * from specalist";
			PreparedStatement ps = con.prepareStatement(sql);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				s = new Specalist();
				s.setId(rs.getInt(1));
				s.setSpecalistName(rs.getString(2));
				list.add(s);
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}
	
}
