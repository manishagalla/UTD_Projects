<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.bidding.web.model.User"%>
<%@page import="java.util.*"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Theme Simply Me</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
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
  <style>
  .container{
margin-top:5px;
} 
.details li {
      list-style: none;
    }
li {
        margin-bottom:10px;
        
    }
.jumbotron{
	border:2px solid green;
	box-shadow:10px 10px 5px #888888;
	margin-top:120px;
	}
	#reg
	{
	margin-left:350px;
	}
  body {
      font: 20px Montserrat, sans-serif;
      line-height: 1.8;
      color: #f5f6f7;
  }
  p {font-size: 16px;}
  .margin {margin-bottom: 45px;}
  .bg-1 { 
      background-color: #1abc9c; /* Green */
      color: #ffffff;
  }
  .bg-2 { 
      background-color: #474e5d; /* Dark Blue */
      color: #ffffff;
  }
  .bg-3 { 
      background-color: #ffffff; /* White */
      color: #555555;
  }
  .bg-4 { 
      background-color: #2f2f2f; /* Black Gray */
      color: #fff;
  }
  .container-fluid {
      padding-top: 20px;
      
  }
  .navbar {
      padding-top: 15px;
      padding-bottom: 15px;
      border: 0;
      border-radius: 0;
      margin-bottom: 0;
      font-size: 12px;
      letter-spacing: 5px;
  }
  .navbar-nav  li a:hover {
      color: #1abc9c !important;
	  font-size: 16px;
  }
  .container{
   color:black;
  }
  .align{
   margin-left:20%;
  }
  .control-label{
   font-size: 15px;
  }
  .profile{
      padding-left: 10%;
	  font-family: "Lucida Sans Unicode", "Lucida Grande", sans-serif;
	  color: #4CAF50;
	  font-weight: bold;
	  font-size: 16px;
	  width: 50%;
	  margin-left: 25%;
	  margin-top: 5%;
	  
  }
  </style>
</head>
<body>
<header>
<!-- <% if (session == null)
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
	
	%> -->
<div id="main">
  <span style="font-size:30px;cursor:pointer" onclick="openNav()">&#9776;</span>
</div>
<!-- Navbar -->
<nav class="navbar navbar-inverse">
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
	  <span style="font-size:30px;cursor:pointer;color:white" onclick="openNav()">&#9776;</span>
      
	  
    </div>
  <form name="search" action="searchItems">
    <input type="hidden" name="userId" value="<%=userid%>"> 
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
      <li><a href="hithomepage">Home</a></li>
      <li><a href=""></a></li>
      <li><a href=""></a></li>
      <li><a href=""></a></li>
      <li><a href=""></a></li>
      <li><a href=""></a></li>
      <li><a href=""></a></li>
      <li><a href=""></a></li>
      <li><a href=""></a></li>
      <li><a href=""></a></li>
      <li><a href=""></a></li>
      <li><a href=""></a></li>
      <li><a href=""></a></li>
      <li><a href=""></a></li>
        
	    <li><a><input type="search" name="searchKeyword">
            <input type="submit" name="submit" value="Go"></a></li>	
		
      <li><a href="getUserProfile?userId=${userId}">My Profile</a></li>
        <li><a href="logout">Logout</a></li>
        
      </ul>
    </div></form>
  </div>
</nav>
<div id="mySidenav" class="sidenav">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
   <p><%=firstname %> <%=lastname %></p>
  <p><img src="resources/core/img/logos/phone.jpg">&nbsp;<%=mobile %></p>
  <p><img src="resources/core/img/logos/email1.jpg">&nbsp;<%=email %> </p>
  <div class="footer">
  <p style="font-size: 15px">Last Login: <%=date %></p>
  <p style="font-size: 15px">Location: <%=location %></p>
  </div>
</div>
</header>
 <form id="bid" action="bidItemAttempt" method="GET">
	<div class="container">    
                <div class="jumbotron">
                  <div class="row">
                      <div class="col-md-4 col-xs-12 col-sm-6 col-lg-4">
                          
                      </div>
                      
                            <hr>
           <div id="reg">
                          <p>Enter Price</p>
            <p style="color:black"><input type="number" pattern="[0-9]" name="bidValue" placeholder="Enter amount in dollars" required autocomplete="off"></p>
			<input type="hidden" name="userId" value="<%=userid%>"> <%} %>
			<input type="hidden" name="itemPrice" value="${itemPrice}">
			<input type="hidden" name="itemId" value="${itemId}">
            <input type="submit" value="Create"/>
          
            </div>
                         
                      </div>
                  </div>
                </div>
				</form>
</body>
</html>