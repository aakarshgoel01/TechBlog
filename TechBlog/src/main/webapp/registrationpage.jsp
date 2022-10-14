<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<!-- css -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

<link href="css/mystyle.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style>
.banner-background {
	clip-path: polygon(50% 0%, 100% 0, 100% 83%, 67% 100%, 17% 83%, 0 100%, 0 0);
}
</style>

</head>
<body>

   <%@include file="normal_navbar.jsp" %>

	<main class="primary-background banner-background" style="padding-bottom:100px;">
		<div class="container">
			<div class="col-md-6 offset-md-3">
				<div class="card">
					<div class="card-header text-center primary-background text-white">
						<span class="fa fa-user-plus fa-3x"></span> <br> Registration
					</div>
					<div class="card-body">

						<form id="reg-form" action="Registration" method="post">

							<div class="form-group">
								<label for="Username">User Name</label> <input name="user-name" type="text"
									class="form-control" id="username"
									placeholder="Enter User Name">
							</div>

							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									name="user-email" type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter email">
								<small id="emailHelp" class="form-text text-muted">We'll
									never share your email with anyone else.</small>
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									name="user-password" type="password" class="form-control" id="exampleInputPassword1"
									placeholder="Password">
							</div>

							<div class="form-group">
								<label for="gender">Gender</label> <input type="radio"
									id="gender" name="gender" value="male"> Male <input type="radio"
									id="gender" name="gender" value="female"> Female
							</div>

							<div class="form-group">
								<textarea name="about-user" id="about" class="form-control" rows="5" cols="30"
									placeholder="Enter Something about your self."></textarea>
							</div>

							<div class="form-check">
								<input name="check" type="checkbox" class="form-check-input"
									id="exampleCheck1"> <label class="form-check-label"
									for="exampleCheck1"> Agree Terms and Conditions.</label>
							</div>
							<br>
							
							<div id="loader" class="container text-center" style="display:none;">
							    <span class="fa fa-refresh fa-spin fa-4x"></span>
							    <br>
							    <h4>Please Wait....</h4>
							    <br>
							</div>
							
							<button type="submit" class="btn btn-primary" id="submit-btn">Submit</button>
						</form>

					</div>

					<div class="card-footer"></div>

				</div>
			</div>
		</div>
	</main>

	<!-- java script -->

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
		<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
		
   <script type="text/javascript">
       $(document).ready(function(){
    	   console.log("loaded.....")
    	   
    	   $('#reg-form').on('submit',function(event){
    		  event.preventDefault();
    		  
    		  $('#loader').show();
    		  $('#submit-btn').hide();
    		  
    		  
    		  let form = new FormData(this);
    		  
    		  //send to register servlet
    		  
    		  
    		  $.ajax({
    			  url:"Registration" ,
    			  type:'POST',
    			  data: form ,
    			  
    			  
    			  success: function(data,textStatus,jqXHR){
    				  console.log(data)
    				  $('#loader').hide();
    	    		  $('#submit-btn').show();
    	    		  
    	    		  if(data.trim()==='User added Successfully.'){
    	    		  swal("Registration Successfull....We are going to redirect to login page.")
    	    		  .then((value) => {
    	    		    window.location = "loginpage.jsp";
    	    		  });
    	    		  }else{
    	    			  swal(data);
    	    		  }
    			  },
    			  error: function(jqXHR,textStatus,errorThrown){
    				  consolo.log(jqXHR)
    				  $('#loader').hide();
    	    		  $('#submit-btn').show();
    	    		  
    	    		  swal("Some error occured... try again ");
    	    		  
    			  },
    			  
    			  processData:false,
    			  contentType:false
    			  
    		  });
    		  
    		  
    		  
    	   });
    	   
    	   
    	   
       });
   </script>

</body>
</html>