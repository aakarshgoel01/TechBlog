package com.techblog.helper;


import java.io.FileOutputStream;
import java.io.InputStream;

public class Helper {
	
	
	public static boolean updateProfile(InputStream is , String path) {
		
		boolean f = false;
		
		try {
			
			byte[] b = new byte[is.available()];
			
			is.read(b);
			
			FileOutputStream fos = new FileOutputStream(path);
			System.out.println(path);
			fos.write(b);
			
			fos.flush();
			fos.close();
			f = true;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}
	

}
