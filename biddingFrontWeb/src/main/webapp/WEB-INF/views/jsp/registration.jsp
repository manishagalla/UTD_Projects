<html>
<head>

<link href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script type="text/javascript"></script>
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
h1:hover{
border:2px solid #5cb85c;
 }
</style>
</head>
<body>
<div class="container">
    <h1 class="well">REGISTRATION FORM</h1>
	<div class="col-lg-12 well">
	<div class="row">
				<form  method="POST" action="register">
					<div class="col-sm-12">
						<div class="row">
							<div class="col-sm-6 form-group">
								<label>First Name</label>
								<input name="firstName" type="text" placeholder="Enter First Name Here.." class="form-control">
							</div>
							<div class="col-sm-6 form-group">
								<label>Last Name</label>
								<input name="lastName"  type="text" placeholder="Enter Last Name Here.." class="form-control">
							</div>
						</div>					
						<div class="form-group">
						<label>Street Name</label>
						<input  name="streetName" type="text"  placeholder="Enter Street Name Here.."class="form-control">
					</div>
						<div class="row">
							<div class="col-sm-4 form-group">
								<label>City</label>
								<input name="city" type="text" placeholder="Enter City Name Here.." class="form-control">
							</div>	
							<div class="col-sm-4 form-group">
								<label>State</label>
								<input name="state" type="text" placeholder="Enter State Name Here.." class="form-control">
							</div>	
							<div class="col-sm-4 form-group">
								<label>Zip</label>
								<input name="zipcode" type="text" placeholder="Enter Zip Code Here.." class="form-control">
							</div>		
						</div>
						<div class="row">
							<div class="col-sm-6 form-group">
								<label>Country</label>
								<input  name="country" type="text" placeholder="Enter Country Name Here.."class="form-control">
							</div>		
							<div class="col-sm-6 form-group">
								<label>Phone Number</label>
								<input  name="mobile" type="text" placeholder="Enter phone number" class="form-control">
							</div>	
						</div>		
             <div class="row">
							<div class="col-sm-6 form-group">
								<label>DOB</label>
								<input  name="DOB" type="date" class="form-control">
							</div>		
							<div class="col-sm-6 form-group">
								<label>Sex</label>
								<input name="sex" type="text" placeholder="Enter Male or Female" class="form-control">
							</div>	
						</div>							
					<div class="form-group">
						<label>Email Address</label>
						<input name="email" type="text" placeholder="Enter Email Address" class="form-control">
					</div>		
					<div class="form-group">
						<label>Username</label>
						<input name="userName" type="text" placeholder="Enter username" class="form-control">
					</div>	
					<div class="form-group">
						<label>Password</label>
						<input  name="password" type="password" placeholder="Enter password" class="form-control">
					</div>
					<button type="submit" class="btn btn-success btn-block">Submit</button>					
					</div>
				</form> 
				</div>
	</div>
	</div>
	</body>
	</html>