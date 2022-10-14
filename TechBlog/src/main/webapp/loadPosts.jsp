<%@page import="com.techblog.dao.*"%>
<%@page import="com.techblog.helper.*"%>
<%@page import="java.util.*"%>
<%@page import="com.techblog.entities.*"%>


<div class="row">

	<%
	PostDao post = new PostDao(ConnectionProvider.getConnection());
	
	int cid =Integer.parseInt(request.getParameter("cid"));
	
	List<Posts> list = new ArrayList<>();
	
	if(cid==0){
	list = post.getAllPosts();
	}else{
	list = post.getPostsByCategories(cid);	
	}
	
	if(list.size() == 0)
	{
		out.print("No Posts for this category... Please Post Something !!!");
				return;
	}
	
	String path = request.getRealPath("/")+"blogPics";
	
	for (Posts p : list) {
	%>
	<div class="col-md-6 mt-3">
		<div class="card">
			<img class="card-img-top" src="blogPics/<%=p.getPic()%>">
			<b><%=p.getTitle()%></b>
			<p><%=p.getContent() %></p>
		</div>
		<div class="card-footer text-center primary-background">
		
			<a href="showBlogPage.jsp?postid=<%= p.getPid() %>" class="btn btn-outline-light primary-background btn-sm"> Read More... </a>
			<a href="#!" class="btn btn-outline-light primary-background btn-sm"> <i class="fa fa-thumbs-o-up"></i><span>10</span> </a>	
			<a href="#!" class="btn btn-outline-light primary-background btn-sm"> <i class="fa fa-commenting-o"></i><span>10</span> </a>		
		
		</div>
		
	</div>
	<%
	}
	%>

</div>