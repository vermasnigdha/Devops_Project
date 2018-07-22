<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<!-- Latest compiled and minified CSS -->
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


<br>

<h1 style="margin: auto; width: 80%; text-align: center;">Add Breed</h1>

<br>

<form:form method="post" action="UpdateBreedToDB" modelAttribute="Breed" style="margin: auto; width: 80%; text-align: center;">

	<br>
	<form:input path="name" type="text" class="form-control" placeholder="Breed Name"/>
	
	<br>
	<form:input path="average_weight" type="text" class="form-control" placeholder="Breed Average Weight"/>
	
	<br>
	<form:input path="price" type="text" class="form-control" placeholder="Breed Price"/>
	
	<br>
	<form:input path="qty" type="text" class="form-control" placeholder="Breed's Quantity"/>
	
	<br>
	<input type="submit" class="btn btn-primary" value="Submit"/>

</form:form>


</body>
</html>