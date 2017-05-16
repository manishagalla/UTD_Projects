<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.bidding.web.model.Item"%>
<%@page import="com.bidding.web.model.User"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html lang="en">
    <head> 
		<meta name="viewport" content="width=device-width, initial-scale=1">


		<!-- Website CSS style -->
		<link href="resources/core/css/bootstrap.min.css" rel="stylesheet">
        <link href="http://fonts.googleapis.com/css?family=Pacifico&subset=latin-ext,vietnamese" rel="stylesheet">
		<!-- Website Font style -->
	    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
		<link rel="stylesheet" href="resources/core/css/itemsList.css">
		<!-- Google Fonts -->
		<link href="http://fonts.googleapis.com/css?family=Quicksand:300,400,500,700&subset=latin-ext,vietnamese" rel="stylesheet">
        <link href="resources/core/css/bootstrap.min.css" rel="stylesheet">
		<link href="resources/core/css/homepage.css" rel="stylesheet">
		<script src="resources/core/js/homepage.js"> </script>
		<link href="resources/core/css/newhome.css" rel="stylesheet">
		<link href="http://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
		<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
		<script src="resources/core/js/bootstrap.min.js"></script>
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
		<div class="container">
		
	<div class="row">
	<% 
 int count=0;
 Item item = new Item();
  List<Item> items=  (ArrayList<Item>)request.getAttribute("itemList");
  
 for(int i=0;i<items.size();i++){
	    item = items.get(i);
	   count++;			
          %>
	
    	<!-- BEGIN PRODUCTS -->
  		<div class="col-md-3 col-sm-6">
    		<span class="thumbnail">
      			<img src="<%=item.getImageUrl()%>" alt="...">
      			<h4 class="detail"><%=item.getItemName()%> <span class="status" <%=item.getStatus()%></span></h4>
      			<p><%=item.getItemDesc()%></p>
      			<hr class="line">
      			<div class="row">
      				<div class="col-md-6 col-sm-6">
      					<p class="price">$<%=item.getItemPrice()%></p>
      				</div>
      				<div class="col-md-6 col-sm-6">
      				 <a href="bid?userId=<%=userid%>&itemId=<%=item.getItemId()%>&itemPrice=<%=item.getItemPrice() %>" target="_blank" >	<button class="btn btn-info right" > BUY ITEM</button></a>
      				</div>
      				
      			</div>
    		</span>
  		</div>
  	<%} %>	
<%} %>
		<!-- END PRODUCTS -->
	</div>
</div><!-------container----->


    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->

	</body>
</html>