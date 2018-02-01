<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

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
      <a class="navbar-brand" href="#" style="color: black">Website</a>
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
        <li><a href="#" data-toggle="modal" data-target="#mymodal1" style="color: black;"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
      </ul>
    </div>
  </div>
</nav>
<div class="masthead">
<div id="myCarousel" class="carousel fade-carousel slide" data-ride="carousel" style="margin: auto; background-color:black;">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
    <li data-target="#myCarousel" data-slide-to="1"></li>                                                             
    <li data-target="#myCarousel" data-slide-to="2"></li>
  </ol>

  <!-- Wrapper for slides -->
  <div class="carousel-inner">
    <div class="item active">
      <img src="resources/dogs/pug.jpg" alt="Pug1" style="margin:auto;">
      <div class="carousel-caption">
        <h3>Pug1</h3>
      </div>
    </div>

    <div class="item">
      <img src="resources/dogs/pug.jpg" alt="Pug2" style="margin:auto;">
      <div class="carousel-caption">
        <h3>Pug2</h3>
      </div>
    </div>

    <div class="item">
      <img src="resources/dogs/havanese.jpg" alt="Havanese" style="margin:auto;">
      <div class="carousel-caption">
        <h3>Havanese</h3>
      </div>
    </div>
  </div>
</div>    
</div> 
  <br>
  
 <h3 style="margin-left:100px;">Best Sellers</h3>
<div class="row" style="margin-top:50px;">
  <div class="col-lg-4" align="center">
    <img src="resources/dogs/shihtzu.jpg" class="img-circle img-thumbnail" alt="Shih Tzu" width="300" height="300">
    <h4>Shih Tzu</h4>
  </div>
  <div class="col-lg-4" align="center">
    <img src="resources/dogs/labrador.jpg" class="img-circle img-thumbnail" alt="Labrador Retriever" width="300" height="300">
    <h4>Labrador Retriever</h4>
  </div>
  <div class="col-lg-4" align="center">
    <img src="resources/dogs/chowchow.jpg" class="img-circle img-thumbnail" alt="Chow Chow" width="300" height="300">
    <h4>Chow Chow</h4>
  </div>
</div>

<div id="mymodal1" class="modal fade" role="dialog">
  <div class="modal-dialog">

	<form method="post" action="login">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Login Page</h4>
      </div>
      <div class="modal-body">
       <div class="form-group">
        <label for="email">Email:</label>
          <input type="email" class="form-control" id="email" name="a">
       </div>
       <div class="form-group">
        <label for="pwd">Password:</label>
          <input type="password" class="form-control" id="pwd" name="b">
       </div>
        <button type="submit" class="btn btn-default">Login</button>
      </div>
      
      <c:if test="${param.error == 'InvalidLogin'}">
		<h1 class="alert alert-danger" style="text-align: center;">Invalid Credentials</h1>
		</c:if>
      
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>
    </form>

  </div>
</div>

<c:if test="${param.error == 'InvalidLogin'}">
<script type="text/javascript">
	$("#mymodal1").modal('show');
</script>
</c:if>


</body>
</html>