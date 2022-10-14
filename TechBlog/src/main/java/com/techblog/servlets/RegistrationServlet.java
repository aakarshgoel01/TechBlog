package com.techblog.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.techblog.dao.UserDao;
import com.techblog.entities.User;
import com.techblog.helper.ConnectionProvider;

@WebServlet("/Registration")
@MultipartConfig
public class RegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public RegistrationServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		String check = request.getParameter("check");

		if (check == null) {
			out.println("Terms and Conditions are not checked");
		} else {

			String name = request.getParameter("user-name");
			String email = request.getParameter("user-email");
			String password = request.getParameter("user-password");
			String gender = request.getParameter("gender");
			String about = request.getParameter("about-user");
			
			User user = new User(name,email,password,about,gender);
			
			
				UserDao addData = new UserDao(ConnectionProvider.getConnection());
				
				if(addData.saveUser(user)) {
					out.println("User added Successfully.");
				}else {
					out.println("Some Error Occured.");
				}
				
				
			
			
		}
	}

}
