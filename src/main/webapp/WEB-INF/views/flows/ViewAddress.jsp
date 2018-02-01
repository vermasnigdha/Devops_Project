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
    
    $scope.BAdd='';
    $scope.SAdd='';

    $scope.done = false;
    
    $http(	{
    			method: 'POST',
	      		url: 'http://localhost:8080/shoes/getAddress',
	      		 headers : {'Content-Type':'application/x-www-form-urlencoded'}
    			}).then(function(response){
			    	console.log(response.data);
			    
			    	$scope.data = response.data;
			   
			    	$scope.BAdd=response.data.SAddr;
			        $scope.SAdd=response.data.BAddr;
			        
			        console.log( $scope.SAdd );
			        console.log( $scope.BAdd );
    			});
    
 $scope.Update=function(){
    	
	 	var json = {"ship":$scope.SAdd,"bill":$scope.BAdd};
	 
    	$http(	{
			method: 'POST',
      		url: 'http://localhost:8080/shoes/UpdateCartAddToDB',
      		data:JSON.stringify(json),
      		 headers : {'Content-Type':'application/json'}
			}).then(function(response){
		    	console.log(response.data);
		    
		    	if(response.data.msg=="Updated")
		    	{
		    		$scope.done = true;	    	
		    	}
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

<h1 class="alert alert-success"><center>Confirm Billing Address</center></h1>
<br><br><br>
<table class="table table-striped " style="margin: auto; width: 50%;">
	<thead>
		<tr>
      		<th>${currUser} Shipping Address</th>
			<th>${currUser} Billing Address</th>			
		</tr>
	</thead>
	<tbody>
		<tr>
			<td><textarea rows="5" name="SAddr"  class="form-control" ng-model="SAdd" placeholder="Enter Shipping Address"></textarea></td>
			<td><textarea rows="5" name="BAddr" class="form-control" ng-model="BAdd"></textarea></td>
		</tr>
	</tbody>
	
	<tbody>
		<tr>
			<td><button ng-click="Update()" class="btn btn-success">Edit</button></td>
			<td><button ng-click="Update()" class="btn btn-success">Edit</button></td>
		</tr>
	</tbody>
</table>
<br>
<br>
<h1 class="text text-success" ng-show='done' style="margin: auto; width: 80%; text-align: center;">Updated Successfully</h1>
<br>
<br>
<center>
<a href="${flowExecutionUrl}&_eventId=goToPage1" class="btn btn-success" style=" float:left; margin-left:50px; margin-top:45px">View Cart</a>
<a href="${flowExecutionUrl}&_eventId=goToPage3" class="btn btn-success" style=" float:right; margin-right:50px; margin-top:45px">Invoice</a></center>
</body>
</html>