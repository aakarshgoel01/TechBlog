package com.techblog.dao;

import java.sql.*;

import com.techblog.entities.User;

public class UserDao {
	
	private Connection con;

	public UserDao(Connection con) {
		super();
		this.con = con;
	}
	
	public boolean saveUser(User user) {
		
		boolean f = false;
		
		try {
			
			String query= "insert into user (name,email,password,gender,about) values(?,?,?,?,?)";
			
			PreparedStatement pstmt = this.con.prepareStatement(query);
			
			pstmt.setString(1, user.getName());
			pstmt.setString(2, user.getEmail());
			pstmt.setString(3, user.getPassword());
			pstmt.setString(4, user.getGender());
			pstmt.setString(5, user.getAbout());
			
			pstmt.executeUpdate();
			
			f = true;
			
			
		}catch(Exception ee) {
			ee.printStackTrace();
		}
		
		
		
		return f;
		
	}
	
	public User getUserByEmailAndPassword(String email , String password) {
		
		User user = null ;
		
		try {
			
			String query="select * from user where email=? and password = ?";
			
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setString(1, email);
			pstmt.setString(2, password);
			
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				user = new User();
				user.setName(rs.getString("name"));
				user.setGender(rs.getString("gender"));
				user.setAbout(rs.getString("about"));
				user.setId(rs.getInt("id"));
				user.setDate(rs.getTimestamp("date"));
				user.setEmail(rs.getString("email"));
				user.setPassword(rs.getString("password"));
				user.setProfile(rs.getString("profile"));
			}
			
			
		}catch(Exception ee) {
			ee.printStackTrace();
		}
		
		
		
		return user;
		
	}
		
	
	public boolean updateUser(User user) {
		boolean f = false;
		
		String name = user.getName();
		String Email = user.getEmail();
		String password = user.getPassword();
		String about = user.getAbout();
		String profile = user.getProfile();
		
		String query = "update user set name=? , email=? , password=? , about=? , profile=? where id=? ";
		
		try {
			
			
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setString(1, name);
			pstmt.setString(2, Email);
			pstmt.setString(3, password);
			pstmt.setString(4,about);
			pstmt.setString(5, profile);
			pstmt.setInt(6, user.getId());
			
			pstmt.executeUpdate();
			f = true;
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return f;
		
	}
	
	public User getUserByUserId(int uid)
	{
		
		User user = null;
		
		try {
			
			String query = "select * from user where id=?" ;
			
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setInt(1, uid);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				String name = rs.getString("name");
				String email = rs.getString("email");
				String password = rs.getString("password");
				String gender = rs.getString("gender");
				Timestamp date = rs.getTimestamp("date");
				String profile = rs.getString("profile");
				String about = rs.getString("about");
				user = new User(uid,name , email, password,about,gender,date,profile);
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return user;
		
		
	}
	
}
