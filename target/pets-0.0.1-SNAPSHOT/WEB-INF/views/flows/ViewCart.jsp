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

<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>

</head>
<script type="text/javascript">

angular.module("myApp",[]).controller("myCtrl",["$scope","$http",function($scope,$http){
	
	console.log('myApps myCtrl');
	
	$http({url:"http://localhost:9001/pets/fetchCartItems",method:"POST",headers: {'Content-Type': 'application/json'}}).then(function( response ){
		console.log(response);
		
		$scope.data = response.data;
	});
}]);

</script>

<body ng-app="myApp" ng-controller="myCtrl">

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
      </ul>
    </div>
  </div>
</nav>

<h1>View Cart</h1>

<a href="${pageContext.request.contextPath}/ViewBreed">View All Breeds</a>
<a href="${flowExecutionUrl}&_eventId=goToPage2">Select Address</a>

<div ng-repeat="x in data">{{x.name}}</div>

</body>
</html>