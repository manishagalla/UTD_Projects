<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.bidding.web.model.User"%>
<%@page import="java.util.*"%>
<html>
<head>
<link href="resources/core/css/bootstrap.min.css" rel="stylesheet">
  <link href="resources/core/css/homepage.css" rel="stylesheet">
  <script src="resources/core/js/homepage.js"> </script>
  <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
  <script src="resources/core/js/bootstrap.min.js"></script>
  <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet">
  <script type="text/javascript" src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
  <script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
  
   
<script>
  function openNav() {
    document.getElementById("mySidenav").style.width = "250px";
    document.getElementById("main").style.marginLeft = "250px";
}

function closeNav() {
    document.getElementById("mySidenav").style.width = "0";
    document.getElementById("main").style.marginLeft= "0";
	
}

</script>
<link href="resources/core/css/registration.css" rel="stylesheet">
<style>
.btn-info{
background-color:#5cb85c;
}
h1{
color:#5cb85c;
text-shadow:2px 2px 4px;
text-align:center;
}
button{

}
h1:hover{
border:2px solid #5cb85c;
 }
</style>
</head>
<body>
<% if (session == null)
	{
	String address = "/login-error.jsp";
	RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(address);
	dispatcher.forward(request,response);
	}
else
{
	Integer userid=(Integer)session.getAttribute("userId"); 
	String firstname =(String)session.getAttribute("firstname");
	String lastname =(String)session.getAttribute("lastname");
	String mobile =(String)session.getAttribute("mobile");
	String email =(String)session.getAttribute("email");
	String location =(String)session.getAttribute("location");
	Date date =(Date)session.getAttribute("lastlogin");
	%>
<%
}
 %>


<div class="container">
    <h1 class="well">Edit Your Profile</h1>
	<div class="col-lg-12 well">
	<div class="row">
				<form  method="POST" action="editUserProfile">
				<input type="hidden" name="userId" value="${user.getUserId()}">
					<div class="col-sm-12">
						<div class="row">
							<div class="col-sm-6 form-group">
								<label>First Name</label>
								<input name="firstName" type="text" value="${user.getFirstName()}" class="form-control">
							</div>
							<div class="col-sm-6 form-group">
								<label>Last Name</label>
								<input name="lastName"  type="text" value="${user.getLastName()}" class="form-control">
							</div>
						</div>					
						<div class="form-group">
						<label>Street Name</label>
						<input  name="streetName" type="text"  value="${user.getStreetName()}"class="form-control">
					</div>
						<div class="row">
							<div class="col-sm-4 form-group">
								<label>City</label>
								<input name="city" type="text" value="${user.getCity()}" class="form-control">
							</div>	
							<div class="col-sm-4 form-group">
								<label>State</label>
								<input name="state" type="text" value="${user.getState()}" class="form-control">
							</div>	
							<div class="col-sm-4 form-group">
								<label>Zip</label>
								<input name="zipcode" type="text" value="${user.getZipcode()}" class="form-control">
							</div>		
						</div>
						<div class="row">
							<div class="col-sm-6 form-group">
								<label>Country</label>
								<input  name="country" type="text" value="${user.getCountry()}" class="form-control">
							</div>		
							<div class="col-sm-6 form-group">
								<label>Phone Number</label>
								<input  name="mobile" type="text" value="${user.getMobile()}" class="form-control">
							</div>	
						</div>		
             <div class="row">
							<div class="col-sm-6 form-group">
								<label>DOB</label>
								<input  name="DOB" type="date" class="form-control" value="${user.getDOB()}">
							</div>		
							<div class="col-sm-6 form-group">
								<label>Sex</label>
								<input name="sex" type="text" value="${user.getSex()}" class="form-control">
							</div>	
						</div>							
					<div class="form-group">
						<label>Email Address</label>
						<input name="email" type="text" value="${user.getEmail()}" class="form-control">
					</div>		
					<div class="form-group">
						<label>Username</label>
						<input name="userName" type="text" value="${user.getUserName()}" class="form-control" readonly>
					</div>	
					<div class="form-group">
						<label>Password</label>
						<input  name="password" type="password" value="${user.getPassword()}" class="form-control" readonly>
					</div>
					<button type="submit" class="btn btn-success btn-block">Save Changes</button>					
					</div>
				</form> 
				</div>
	</div>
	</div>
	</body>
	</html>