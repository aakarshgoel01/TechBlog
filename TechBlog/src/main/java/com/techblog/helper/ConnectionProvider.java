package com.techblog.helper;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionProvider {
    private static Connection con;
    
    public static Connection getConnection() {
		
    	try {
    		
    		if(con==null) {
    			Class.forName("com.mysql.cj.jdbc.Driver");
        		
        		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/techblog", "root", "182357");
        		
    		}
    		
    		
    	}catch(Exception ee) {
    		ee.printStackTrace();
    	}
    	return con;
    	
    }
    
}
