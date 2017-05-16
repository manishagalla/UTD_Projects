<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.bidding.web.model.User"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<link href="resources/core/css/bootstrap.min.css" rel="stylesheet">
<link href="resources/core/css/homepage.css" rel="stylesheet">
<script src="resources/core/js/homepage.js"> </script>
<link href="resources/core/css/newhome.css" rel="stylesheet">
<link href="http://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
 <script src="resources/core/js/bootstrap.min.js"></script>
  <link href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet">
  <script type="text/javascript" src="http://code.jquery.com/jquery-1.10.2.min.js"></script>
  <script type="text/javascript" src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
  <script type="text/javascript">$(function(){
$('a[title]').tooltip();
});
</script>
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
   <script src="http://use.fontawesome.com/4170a39cd3.js"></script>
    <link href="http://fonts.googleapis.com/css?family=Muli:400,400i" rel="stylesheet">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link href="home.css" rel="stylesheet"/>
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    

  <style>
  body {
      font: 20px Montserrat, sans-serif;
      line-height: 1.8;
      color: #f5f6f7;
  }
  p {font-size: 16px;}
 .margin {
 margin-bottom: 45px;
 }
  .navbar {
      padding-top:15px;
      padding-bottom:15px;
	  padding-left:40px;
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

html, body {
    width: 100%;
}
table {
    margin: 0 auto;
}
.carousel{
   margin-top:150px;
   }
   .nav-tabs{
   margin-left:230px;
   }
   .nav-tabs{
   border-bottom:none;
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
	
	%>
<header>
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
		
      <li><a href="getUserProfile?userId=<%=userid%>">My Profile</a></li>
        <li><a href="logout">Logout</a></li>
        
      </ul>
    </div></form>
  </div>
</nav>
<div id="mySidenav" class="sidenav">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
  <p>${user.getFirstName()} ${user.getLastName()} </p>
  <p><img src="resources/core/img/logos/phone.jpg">&nbsp;${user.getMobile()}</p>
  <p><img src="resources/core/img/logos/email1.jpg">&nbsp;${user.getEmail()} </p>
  <div class="footer">
  <p style="font-size: 15px">Last Login: ${user.getModifiedDate()}</p>
  <p style="font-size: 15px">Location: ${user.getLocation()}</p>
  </div>
</div>
</header>
                    <div class="board-inner">
                    <ul class="nav nav-tabs" id="myTab">
                    <li>
                   <a href="createnewbid" title="Create bid"><img src="resources/core/img/logos/add.jpg" width="80px" height="80px">
             </a>
                      
                  </li>

                  <li>
                        <a href="searchItems?searchKeyword=noKeyword&userId=<%=userid%>" title="Bid item"><img src="resources/core/img/auction_hammer.png" width="80px" height="80px"></a>
                     
                 </li>
                 <li>
                          <a href="myBids?userId=<%=userid%>" title="My Bids"><img src="resources/core/img/shoppingbag.png"  width="80px" height="80px"></a>
            
                     </li>

                     <li>
                       <a href="myPostedItems?userId=<%=userid%>" title="Posted items"><img src="resources/core/img/posted.jpg" width="80px" height="80px"></a>
                         </li>

                     <li>
                    <a href="purchaseHistory?userId=<%=userid%>" title="Purchase History"> <img src="resources/core/img/cart2.png" width="75px" height="75px"></a>
                     </li>
                     <%} %>
                     </ul>
					 </div>
	<h2 style="text-align:center; color:#118742; font-size:25px">${message}</h2>				 
<div class="container" style="margin-left:250px">
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner">
      <div class="item active">
        <img src="resources/core/img/heart.jpg" alt="Los Angeles" width="300px" height="300px">
      </div>

      <div class="item">
        <img src="resources/core/img/ring.jpg" alt="Chicago"  width="300px" height="300px">
      </div>
    
      <div class="item">
        <img src="resources/core/img/clip.jpg" alt="New york" width="300px" height="300px">
      </div>
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</body>
</html>