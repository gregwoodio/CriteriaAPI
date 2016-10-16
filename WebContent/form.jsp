<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
<title>Sign up here</title>
</head>
<body>
	
	<div class='container'>
	<div class='col-md-offset-3 col-md-6'>
		<h1>Sign up here</h1>
	</div>
	
	<div class='col-md-offset-3 col-md-6'>
		<form action="HomeController" method="post" >
			<label for="firstName">First Name:</label> 
			<input type="text" name="firstName" class='form-control'/> 
			<br> 
			<label for="lastName">Last Name:</label> 
			<input type="text" name="lastName" class='form-control'/> 
			<br> 
			<label for="email">Email:</label> <input type="email" name="email" class='form-control'/>
			<br>
			<label for="phoneNumber">Phone number:</label> 
			<input type="text" name="phoneNumber" class='form-control'/> 
			<br> 
			<input type="submit" value="Sign up!" class='btn btn-lg btn-primary'/>
		</form>
	</div>
	
	<div class='col-md-offset-3 col-md-6'>
		<h3>Our other members:</h3>
	</div>
	<div class='col-md-offset-3 col-md-6'>
		<table class='table'>
			<tr>
				<th>First name:</th>
				<th>Last name:</th>
				<th>Email:</th>
				<th>Phone:</th>
			</tr>
			<c:forEach var="item" items="${personList }">
				<tr>
					<td>${item.firstName}</td>
					<td>${item.lastName}</td>
					<td>${item.email}</td>
					<td>${item.phoneNumber}</td>
				</tr>
			</c:forEach>
		</table>
	</div>

	<div class='col-md-offset-3 col-md-6'>
		<h1>Search for a user:</h1>
	</div>
	
	<div class='col-md-offset-3 col-md-6'>
		<form action="HomeController" method="post">
			<p>Query by first name "Smith", or email ends in .com</p>
			<label for="firstName">First Name:</label> 
			<input type="text" name="firstName" class='form-control'/> 
			<input type="hidden" name="query" value="true" /> 
			<br> 
			<input type="submit" value="Search!" class='btn btn-lg btn-primary'/>
		</form>
	</div>
	
	<div class='col-md-offset-3 col-md-6'>
		<h3>Query Results:</h3>
	</div>
	
	<div class='col-md-offset-3 col-md-6'>
		<table class='table'>
			<tr>
				<th>First name:</th>
				<th>Last name:</th>
				<th>Email:</th>
				<th>Phone:</th>
			</tr>
			<c:forEach var="item" items="${queryResults }">
				<tr>
					<td>${item.firstName}</td>
					<td>${item.lastName}</td>
					<td>${item.email}</td>
					<td>${item.phoneNumber}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	
	</div>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
		integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
		crossorigin="anonymous"></script>
</body>
</html>