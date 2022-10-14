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

import com.techblog.dao.PostDao;
import com.techblog.entities.Message;
import com.techblog.entities.Posts;
import com.techblog.entities.User;
import com.techblog.helper.ConnectionProvider;
import com.techblog.helper.Helper;

@MultipartConfig
@WebServlet("/AddPostServlet")
public class AddPostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AddPostServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		
		HttpSession s = request.getSession();
		User user = (User) s.getAttribute("CurrentUser");

		int cid = Integer.parseInt(request.getParameter("post-categories"));
		String title = request.getParameter("post-title");
		String content = request.getParameter("post-content");
		String code = request.getParameter("post-code");
		Part part = request.getPart("post-pic");
		int uid = user.getId();
		
		Posts post = new Posts(title , content , code, part.getSubmittedFileName(), null,cid,uid);
		
		PostDao p = new PostDao(ConnectionProvider.getConnection());
		
		if(p.savePosts(post)) {
			
			
			String Path = request.getRealPath("/")+"blogPics"+File.separator+part.getSubmittedFileName() ;
			
			Helper.updateProfile(part.getInputStream(), Path);
			out.print("Done");
			
		}else {
			out.println("error");
		}
		
	}

}
