<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<nav class="navbar navbar-inverse" style="border-radius: 0px; border: none; background-color: #cc6600;">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar"  style="background-color: #cc6600; border: none;">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span> 
      </button>
      <a class="navbar-brand" style="color: black">Website</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li><a href="/pets/" style="color: black">Home</a></li>
        <li><a href="/pets/aboutus/" style="color: black">About Us</a></li>
        <li><a href="/pets/contactus/" style="color: black">Contact Us</a></li>
        <li><a href="/pets/ViewCategory/" style="color: black">Categories</a></li>
        <li><a href="/pets/ViewBreed/" style="color: black">Breeds</a></li>  
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="/pets/signup/" style="color: black"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
        <!--<li><a href="#" data-toggle="modal" data-target="#mymodal1" style="color: black;"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
      --></ul>
    </div>
  </div>
</nav>

<div id="mymodal1" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Login Page</h4>
      </div>
      <div class="modal-body">
       <div class="form-group">
        <label for="email">Email:</label>
          <input type="email" class="form-control" id="email">
       </div>
       <div class="form-group">
        <label for="pwd">Password:</label>
          <input type="password" class="form-control" id="pwd">
       </div>
        <button type="button"class="btn btn-default" data-dismiss="modal">Login</button>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>

<h1 style="margin: auto; width: 80%; text-align: center;">Login</h1>
<form action="login" method="post" style="margin: auto; width: 90%;">

<br>

<p style="color:black; font-size:25px; float:left">Login</p>

<br>
<br>
<br>
	<span class="text-danger">Email Id: </span>
	<input type="text" placeholder="Email" class="form-control" id="email" name="a">
	<br>
	<span class="text-danger">Password: </span>
	<input type="password" placeholder="Password" class="form-control" id="pass" name="b">
	<br>
	<input type="submit" value="Login" class="btn btn-success" style="width:100%">	
	<br>
	<hr>
	<div class="row" style="width:100%">
		<div class="col-sm-12"><b>New to ShoeRack? <a href="signup">Register Now</a></b></div>
	</div>	
	<br>
</form>


</body>
</html>