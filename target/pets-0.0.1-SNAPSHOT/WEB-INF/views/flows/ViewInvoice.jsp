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

<script>

var app = angular.module("myApp", []).controller("myCtrl", function($scope,$http) {
    
$scope.data = [];
    
    $scope.total = 0;
    
    $http(	{
    			method: 'POST',
	      		url: 'http://localhost:8080/shoes/fetchCartItems',
	      		 headers : {'Content-Type':'application/x-www-form-urlencoded'}
    			}).then(function(response){
			    	console.log(response.data);
			    
			    	$scope.data = response.data;
			    	
			    	for( var x = 0; x < $scope.data.length ; x++ )
			    	{
			    		$scope.total += $scope.data[x].pprice *  $scope.data[x].pqty;
			    	}
			    	
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
		      		url: 'http://localhost:8080/shoes/fetchCartItems',
		      		 headers : {'Content-Type':'application/x-www-form-urlencoded'}
	    			}).then(function(response){
				    	console.log(response.data);
				    
				    	$scope.data = response.data;
				    	
	    			});
			});   	
    }    
});
</script>

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
      </ul>
    </div>
  </div>
</nav>

<h1 class="alert alert-success"><center>Invoice</center></h1>
<br><br><br>
<table class="table table-striped " style="margin: auto; width: 80%;">
	<thead>
		<tr>
			<th></th>
			<th></th>
			<th>Price</th>
			<th>Quantity</th>
			<th>Sub Total</th>		
		</tr>
	</thead>
	
	<tbody>
		<tr ng-repeat="x in data">
			<td><img src="{{x.pimg}}" style="width:100px; height:100px; border: 1px solid black; box-shadow: 8px 8px 6px grey;" class="img-responsive indexcatimage"></td>
			<td>{{x.pname}}</td>			
			<td>&#8377; {{x.pprice}}</td>
			<td>{{x.pqty}}</td>
			<td>&#8377; {{x.pprice*x.pqty}}</td>
			
		</tr>
			<td></td>
			<td></td>
			<td></td>
			<td><span style="font-weight:bold;">Grand Total:-</span></td>
			<td><span style="font-weight:bold;">&#8377; {{total}}</span></td>
		<tr>	
		</tr>
	</tbody>
</table>
<br>
<br>

<div class="row">
		<div class="col-sm-2"></div>
		<div class="col-sm-4"><h3>Shipping Address:</h3></div>
		<div class="col-sm-2"></div>
		<div class="col-sm-4"><h3>Billing Address:</h3></div>
</div>

<div class="row">
		<div class="col-sm-2"></div>
		<div class="col-sm-4"><h3>{{data[0].SAdd}}</h3></div>
		<div class="col-sm-2"></div>
		<div class="col-sm-4"><h3>{{data[0].BAdd}}</h3></div>
</div>
<br>
<br>
<center>
<a href="${flowExecutionUrl}&_eventId=goToPage2" class="btn btn-success" style=" float:left; margin-left:50px; margin-top:45px">Confirm Billing Address</a>
<a href="${flowExecutionUrl}&_eventId=goToPage4" class="btn btn-success" style=" float:right; margin-right:50px; margin-top:45px">Submit Order</a></center>

</body>
</html>