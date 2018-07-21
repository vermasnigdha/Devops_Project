<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

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
      -->
      </ul>
    </div>
  </div>
</nav>
<div style="text-align:center;">
<h1>- Our Mission -</h1>
<p>To provide the most adorable Pet.</p>
<h2>About</h2>
<div>
<p>At Pet Shop, we all come to work every day because we want to solve the biggest problem in mobile. 
<b>Everyone is guessing</b>. Publishers dont know what apps to build, how to monetize them, or even what to price them at. 
Advertisers &amp; brands dont know where their target users are, how to reach them, or even how much they need to spend in 
order to do so. Investors arent sure which apps and genres are growing the quickest, and where users are really spending 
their time (and money).</p>
<p>Throughout the history of business, people use <b>data</b> to make more informed 
decisions. Our mission at Apptopia is to make the app economy more transparent. Today we provide the most actionable mobile 
app data &amp; insights in the industry. We want to make this data available to as many people as possible (not just the top 5%).
</p>
</div>
</div>

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

</body>
</html>