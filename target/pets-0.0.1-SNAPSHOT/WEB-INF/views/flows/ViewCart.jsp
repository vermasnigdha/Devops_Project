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
<script>

var app = angular.module("myApp" , []).controller("myCtrl" , function($scope,$http){
	
	$scope.data = [];
	
	$http( {
				method: 'POST',
				url:'http://localhost:8080/shoes/fetchCartItems',
				headers : {'Content-Type':'application/x-www-form-urlencoded'}
		}).then(function(response){
	    	console.log(response.data);
		    
	    	$scope.data = response.data;
	    	
		});
	
$scope.Delete=function(arg){
    	
    	alert(arg);
    	
    	var json={"id":arg};
    	
    	console.log( JSON.stringify(json) );
    	
    	$http(	{
			method: 'POST',
      		url: 'http://localhost:8080/shoes/deletefromcart',
      		data:JSON.stringify(json),
      		 headers : {'Content-Type':'application/json'}
			}).then(function(response){
		    	console.log(response.data);
		    
		    	//Fetch Again
		    	$http(	{
	    			method: 'POST',
		      		url: 'getAllCartItems',
		      		 headers : {'Content-Type':'application/x-www-form-urlencoded'}
	    			}).then(function(response){
				    	console.log(response.data);
				    
				    	$scope.data = response.data;
				    	
	    			});
			});
    }	
});

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
      <a class="navbar-brand" style="color: black">Website</a>
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


<h1 class="alert alert-success"><center>Display Cart</center></h1>
<br><br><br>
<table class="table table-striped" style="margin: auto; width: 80%; text-align: center;">
	<thead>
			<tr style="text-align: center;">
				<th>NAME</th>
				<th>PRICE</th>
				<th>QUANTITY</th>
				<th>Sub Total</th>
				<th>Image</th>
				<th>DELETE</th>
			</tr>
	</thead>
	<tbody>		
		<tr ng-repeat="x in data">
			<td>{{x.pname}}</td>
			<td>{{x.pprice}}</td>
			<td>{{x.pqty}}</td>
			<td>{{x.pprice*x.pqty}}</td>
			<td><img src="{{x.pimg}}" style="height: 50px; width: 50px;"></td>
			<td><a href="#" class="btn btn-danger">Delete</a></td>
		</tr>
	</tbody>
</table>
<br><br><br>
<center>
<a href="${pageContext.request.contextPath}/ViewBreed" class="btn btn-success" style=" float:left; margin-left:50px; margin-top:45px">View All Breeds </a>

<a href="${flowExecutionUrl}&_eventId=goToPage2" class="btn btn-success" style=" float:right; margin-right:50px; margin-top:45px">Confirm Billing Address</a></center>
</body>
</html>