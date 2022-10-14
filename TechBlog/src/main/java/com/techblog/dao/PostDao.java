package com.techblog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.techblog.entities.*;


public class PostDao {
    Connection con;

	public PostDao(Connection con) {
		super();
		this.con = con;
	}
    
 
	public ArrayList<Categories> getAllCategories() {
    	
    	ArrayList<Categories> list= new ArrayList<>();
    	
    	try {
			
    		String query = "select * from categories" ;
    		
    		Statement st = this.con.createStatement();
    	    ResultSet rs = st.executeQuery(query);
    	    
    	    while(rs.next()) {
    	    	int id = rs.getInt("cid");
    	    	String cat = rs.getString("name");
    	    	String des = rs.getString("description");
    	    	Categories c = new Categories(id,cat,des);
    	    	list.add(c);
    	    }
    	    
    	    return list;
    		
		} catch (Exception e) {
			e.printStackTrace();
		}
    	
    	
    	return list;
    }


	public boolean savePosts(Posts post) {
		boolean f = false;
		
		try {
			
			String query="insert into posts (title , content , code , pic , cid , uid) values (?,?,?,?,?,?)";
			
			PreparedStatement pstmt = this.con.prepareStatement(query);
			
			pstmt.setString(1, post.getTitle());
			pstmt.setString(2, post.getContent());
			pstmt.setString(3, post.getCode());
			pstmt.setString(4, post.getPic());
			pstmt.setInt(5, post.getCid());
			pstmt.setInt(6, post.getUid());
			
			pstmt.executeUpdate();
			f = true;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return f;
	}

	public List<Posts> getAllPosts(){
		
		List<Posts> list = new ArrayList<>();
		
		try {
			
			String query="Select * from posts";
			
			Statement pstmt = con.createStatement();
			ResultSet rs = pstmt.executeQuery(query);
			
			while(rs.next()) {
				int pid = rs.getInt("pid");
				String title = rs.getString("title");
				String content = rs.getString("content");
				String code = rs.getString("code");
				String pic = rs.getString("pic");
				Timestamp date = rs.getTimestamp("date");
				int cid = rs.getInt("cid");
				int uid = rs.getInt("uid");
				
				Posts p = new Posts(pid,title , content , code ,pic, date ,cid,uid );
				list.add(p);  
				
			}
			
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
		
	}
	
	
public List<Posts> getPostsByCategories(int cid){
		
		List<Posts> list = new ArrayList<>();
		
		try {
			
			String query="select * from posts where cid=?";
			
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setInt(1, cid);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int pid = rs.getInt("pid");
				String title = rs.getString("title");
				String content = rs.getString("content");
				String code = rs.getString("code");
				String pic = rs.getString("pic");
				Timestamp date = rs.getTimestamp("date");
				int uid = rs.getInt("uid");
				Posts p = new Posts(pid,title , content , code , pic , date , cid , uid );
				list.add(p);  
				
			}
			
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
		
	}
	
public Posts getSinglePost(int pid) {
	
	Posts post = null;
	
	try {
		
		String query = "select * from posts where pid = ?";
		
		PreparedStatement pstmt = con.prepareStatement(query);
		pstmt.setInt(1, pid);
		ResultSet rs = pstmt.executeQuery(); 
		while(rs.next()) {
			String title = rs.getString("title");
			String content = rs.getString("content");
			String code = rs.getString("code");
			String pic = rs.getString("pic");
			Timestamp date = rs.getTimestamp("date");
			int uid = rs.getInt("uid");
			int cid = rs.getInt("cid");
		    post = new Posts(pid,title , content , code , pic , date , cid , uid );

			
		}
		
		
	}catch(Exception ee) {
		ee.printStackTrace();
	}
	
	return post;
}
	
}
