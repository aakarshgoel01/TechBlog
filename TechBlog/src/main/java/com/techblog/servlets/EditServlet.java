package com.techblog.servlets;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.techblog.dao.UserDao;
import com.techblog.entities.Message;
import com.techblog.entities.User;
import com.techblog.helper.ConnectionProvider;
import com.techblog.helper.Helper;

@WebServlet("/EditServlet")
@MultipartConfig
public class EditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public EditServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		PrintWriter out = response.getWriter();

		String userEmail = request.getParameter("user-email");
		String userName = request.getParameter("user-name");
		String userPassword = request.getParameter("user-password");
		String userAbout = request.getParameter("user-about");
		Part profile = request.getPart("image");
		System.out.println(profile);
		String userProfile = profile.getSubmittedFileName();
		System.out.println(userProfile);
		HttpSession s = request.getSession();

		User user = (User) s.getAttribute("CurrentUser");

		user.setName(userName);
		user.setEmail(userEmail);
		user.setPassword(userPassword);
		user.setAbout(userAbout);

		if (!userProfile.equals(""))
			user.setProfile(userProfile);

		UserDao u = new UserDao(ConnectionProvider.getConnection());

		String path = request.getRealPath("/") + "pics" + File.separator + user.getProfile();
		System.out.println(path);
		if (u.updateUser(user)) {

			if (!userProfile.equals("")) {

				if (Helper.updateProfile(profile.getInputStream(), path)) {
//					System.out.println("profile----------------updated");
					Message msg = new Message("success", "Details Updated Successfully...", "alert-success");
					s.setAttribute("message", msg);
				} else {
					Message msg = new Message("error", "Some error occured...", "alert-danger");
					s.setAttribute("message", msg);
				}

			} else {
//				System.out.println("profile----------------not to be updated");

				Message msg = new Message("success", "Details Updated Successfully...", "alert-success");
				s.setAttribute("message", msg);
			}

		} else {
			Message msg = new Message("error", "Some error occured...", "alert-danger");
			s.setAttribute("message", msg);

		}

		response.sendRedirect("profile.jsp");

	}

}
