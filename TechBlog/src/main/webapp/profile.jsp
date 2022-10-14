<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.techblog.entities.*"%>
<%@page import="com.techblog.helper.*"%>
<%@page import="com.techblog.dao.*"%>
<%@page import="java.util.*"%>
<%@page errorPage="errorpage.jsp"%>
<%
User user = (User) session.getAttribute("CurrentUser");

if (user == null) {
	response.sendRedirect("loginpage.jsp");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Profile</title>


<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

<link href="css/mystyle.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
body{
background:url(blogPics/backgroundImage.webp);
background-size:cover;
background-attachment:fixed;
</style>
}


</head>
<body>


	<!-- navbar -->

	<nav
		class="navbar navbar-expand-lg navbar-dark bg-dark primary-background">
		<a class="navbar-brand" href="index.jsp"> <span
			class="fa fa-asterisk"></span> Tech Blog
		</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link" href="#"><span
						class="fa fa-bell-o"></span> Technical People <span
						class="sr-only">(current)</span> </a></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"><span class="fa fa-check-square-o"></span>
						Catogries </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="#">Programming</a> <a
							class="dropdown-item" href="#">Data Structure</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#">Project Implementation</a>
					</div></li>
				<li class="nav-item"><a class="nav-link" href="#"><span
						class="fa fa-comment-o	
				"></span> Contact</a></li>

				<li class="nav-item"><a class="nav-link" href="#"
					data-toggle="modal" data-target="#add-post-modal"><span
						class="fa fa-share	
				"></span> Do Post </a></li>

			</ul>

			<ul class="navbar nav mr-right">
				<li class="nav-item"><a class="nav-link text-white" href="#"
					data-toggle="modal" data-target="#profile-model"><span
						class="fa fa-user-circle
				"></span> <%=user.getName()%></a></li>

				<li class="nav-item"><a class="nav-link text-white"
					href="LogoutServlet"><span class="fa fa-user-circle
				"></span>
						Logout</a></li>

			</ul>
		</div>
	</nav>


	<!-- navbar end -->


	<!-- main body content  -->

	<main>

		<div class="container">
			<div class="row mt-5">
				<div class="col-md-4 ">

					<div class="list-group">
						<a href="#" onclick="getPosts(0 , this)"
							class=" c-link list-group-item list-group-item-action active">
							All Posts </a>
						<%
						PostDao pd = new PostDao(ConnectionProvider.getConnection());
						ArrayList<Categories> x = new ArrayList<>();

						x = pd.getAllCategories();

						for (Categories a : x) {
						%>
						<a href="#" onclick="getPosts(<%=a.getCid()%> , this)"
							class=" c-link list-group-item list-group-item-action"><%=a.getName()%></a>

						<%
						}
						%>
					</div>

				</div>

				<div class="col-md-8 text-center">

					<div class="container" id="loader">

						<span class="fa fa-refresh fa-4x fa-spin"></span>
						<h3>Loading...</h3>
					</div>

					<div class="conatiner" id="post-container"></div>

				</div>


			</div>

		</div>

	</main>



	<!-- end of main body content -->



	<!-- profile model -->



	<!-- Modal -->
	<div class="modal fade" id="profile-model" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header primary-background text-white">
					<h5 class="modal-title" id="profile-model-Label">Tech Blog</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="continer text-center">
						<img style="border-radius: 50%; max-width: 100px"
							class="img-fluid" src="pics/<%=user.getProfile()%>">
						<p class="modal-title" id="profile-model-Label text-center"><%=user.getName()%></p>

						<div id="user-profile">
							<table class="table">
								<tbody>

									<tr>
										<th scope="row">ID :</th>
										<td><%=user.getId()%></td>
									</tr>

									<tr>
										<th scope="row">Email :</th>
										<td><%=user.getEmail()%></td>
									</tr>
									<tr>
										<th scope="row">Gender :</th>
										<td><%=user.getGender()%></td>
									</tr>
									<tr>
										<th scope="row">Status :</th>
										<td><%=user.getAbout()%></td>
									</tr>
									<tr>
										<th scope="row">Registration Date :</th>
										<td><%=user.getDate().toString()%></td>

									</tr>
								</tbody>
							</table>
						</div>


						<div id="user-edit" style="display: none"
							class="container text-center">
							<h3>Please Edit Carefully</h3>
							<form action="EditServlet" method="post"
								enctype="multipart/form-data">
								<table class="table">

									<tr>
										<td>ID :</td>
										<td><%=user.getId()%></td>
									</tr>

									<tr>
										<td>Email :</td>
										<td><input type="email" class="form-control"
											name="user-email" value="<%=user.getEmail()%>"></td>
									</tr>

									<tr>
										<td>Name :</td>
										<td><input class="form-control" type="text"
											name="user-name" value="<%=user.getName()%>"></td>
									</tr>

									<tr>
										<td>Gender :</td>
										<td><%=user.getGender()%></td>
									</tr>

									<tr>
										<td>Password :</td>
										<td><input class="form-control" type="password"
											name="user-password" value="<%=user.getPassword()%>"></td>
									</tr>

									<tr>
										<td>Profile :</td>
										<td><input type="file" name="image" class="form-control"></td>
									</tr>

									<tr>
										<td>Status :</td>
										<td><textarea class="form-control" name="user-about"
												rows="3"><%=user.getAbout()%></textarea></td>
									</tr>
								</table>

								<button type="submit" class="btn btn-outline-primary">
									Save</button>


							</form>
						</div>

					</div>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<button id="edit-profile-button" type="button"
						class="btn btn-primary">Edit</button>
				</div>
			</div>
		</div>
	</div>



	<!-- profile model end -->


	<!-- do post modal -->

	<!-- Modal -->
	<div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Add Post Here..</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">

					<form id="add-post-form" action="AddPostServlet" method="post">

						<div class="form-group">
							<select class="form-control" name="post-categories">
								<option selected disabled>------select option------</option>

								<%
								PostDao c = new PostDao(ConnectionProvider.getConnection());
								ArrayList<Categories> list;
								list = c.getAllCategories();

								for (Categories cat : list) {
								%>
								<option value="<%=cat.getCid()%>"><%=cat.getName()%></option>
								<%
								}
								%>
							</select>
						</div>

						<div class="form-group">
							<input type="text" name="post-title"
								placeholder="Enter post title" class="form-control">
						</div>

						<div class="form-group">
							<textarea class="form-control" name="post-content"
								style="height: 150px" placeholder="Enter content here"></textarea>
						</div>

						<div class="form-group">
							<textarea class="form-control" name="post-code"
								style="height: 150px" placeholder="Enter code here (if any)"></textarea>
						</div>
						<div class="form-group">
							<label class="form-control">SELECT PICTURE TO BE ADDED :
								<br> <input type="file" name="post-pic">
							</label>
						</div>

						<div class="container text-center">
							<button type="submit" class="btn btn-outline-primary">
								Post</button>
						</div>


					</form>

				</div>

			</div>
		</div>
	</div>


	<!-- do post modal end -->



	<!-- Java script -->



	<script src="https://code.jquery.com/jquery-3.6.1.min.js"
		integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ="
		crossorigin="anonymous"></script>

	<script src="https://code.jquery.com/jquery-3.2.1.jquery.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>


	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>


	<script src="js/myjs.js" type="text/javascript"></script>

	<script>
		$(document).ready(function() {

			let editStatus = false;

			$('#edit-profile-button').click(function() {

				if (editStatus == false) {
					$('#user-profile').hide();
					$('#user-edit').show();
					editStatus = true;
					$(this).text('Back');
				} else {

					$('#user-profile').show();
					$('#user-edit').hide();
					editStatus = false;
					$(this).text('Edit');

				}

			});

		});
	</script>


	<!-- add post ajax -->

	<script type="text/javascript">
		$(document).ready(function() {

			$('#add-post-form').on('submit', function(event) {

				event.preventDefault();
				let form = new FormData(this);

				$.ajax({
					url : "AddPostServlet",
					type : "post",
					data : form,

					success : function(data, textStatus, jqXHR) {
						
						if(data.trim() === 'Done'){
							swal("Posted...!!!", "success").then((value) => {
		    	    		    window.location = "profile.jsp";
		    	    		  });
		    	    		  }else{
		    	    			  swal("Error...!!!","Some Error Occured", "error");
		    	    		  }
						
					},
					error : function(jqXHR, textStatus, data) {

					},

					processData : false,
					contentType : false

				})

			})

		})
	</script>

	<!-- loading posts  -->
	<script type="text/javascript">
	
	function getPosts(catid , temp){
		
		$(".c-link").removeClass('active')
		
		$.ajax({
			url:'loadPosts.jsp',
			data:{cid:catid},
			success: function (data,textStatus,jqXHR){
				console.log(data);
				$('#loader').hide();
				$('#post-container').html(data);
				$(temp).addClass('active')
				
			}
		})
	}
	
		$(document).ready(function(){
			
			let allPostsRef = $('.c-link')[0]
			
			getPosts(0 , allPostsRef)
			
			
		})
		
	</script>


</body>
</html>