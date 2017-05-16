<html>
<head>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="http://netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet">
<style>
h2{
color:#5cb85c;
text-shadow:2px 2px;
text-align:center;
}
#register{
color:#5cb85c;
font-size:20px;
font-weight:bold;
text-align:center;
margin-left:40px;}
</style>
</head>
<body>
    <div id="login-overlay" class="modal-dialog">
      <div class="modal-content">
          <div class="modal-header">
              <h2 class="modal-title" id="myModalLabel"><b>SMART BID</b></h2>
          </div>
          <div class="modal-body">
              <div class="row">
                  <div class="col-xs-6">
                      <div class="well">
                          <form id="loginForm" method="POST" action="login" novalidate="novalidate">
                              <div class="form-group">
                                  <label for="username" class="control-label">Username</label>
                                  <input type="text" class="form-control" id="username" name="userName" value="" required="" title="Please enter you username" placeholder="Enter your username">
                                  <span class="help-block"></span>
                              </div>
                              <div class="form-group">
                                  <label for="password" class="control-label">Password</label>
                                  <input type="password" class="form-control" id="password" name="password" value="" required="" title="Please enter your password">
                                  <span class="help-block"></span>
                              </div>
                              <div id="loginErrorMsg" class="alert alert-error hide">Wrong username or password</div>
                              <!--<div class="checkbox">
                                  <label>
                                      <input type="checkbox" name="remember" id="remember"> Remember login
                                  </label>
                                  <p class="help-block">(if this is a private computer)</p>
                              </div>-->
                              <button type="submit" class="btn btn-success btn-block">Login</button>
                          </form>
                      </div>
                  </div>
                  <div class="col-xs-6">
				  <img src="resources/core/img/bid_icon.jpg" width="190px" height="190px">
				  &nbsp &nbsp &nbsp <p><a href="registernewUser" id="register">Register Now</a></p>
                      
                  </div> 
              </div>
          </div>
      </div>
  </div>
  </body>
  </html>