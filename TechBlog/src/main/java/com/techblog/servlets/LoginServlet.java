package com.techblog.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.techblog.dao.UserDao;
import com.techblog.entities.Message;
import com.techblog.entities.User;
import com.techblog.helper.ConnectionProvider;


@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		
		String userEmail = request.getParameter("user-email");
		String userPassword = request.getParameter("user-password");
		
		UserDao u = new UserDao(ConnectionProvider.getConnection());
		
		User user = u.getUserByEmailAndPassword(userEmail, userPassword);
		System.out.println(user);
			if(user == null) {
				Message msg = new Message("error","Invalid Details ! Try with another","alert-danger");
				HttpSession s = request.getSession();
				s.setAttribute("message", msg);
				response.sendRedirect("loginpage.jsp");
			}else {
			
			HttpSession s = request.getSession();
			s.setAttribute("CurrentUser", user);
			response.sendRedirect("profile.jsp");
			}
		
		
	}

}
