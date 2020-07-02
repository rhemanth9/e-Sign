<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="/e-sign/res/css/icon.css">
<style>
.footer{
 position:fixed;
 bottom:0;
 left:0;
 text-align: center;
	background-color: #edac92;
	color: white;
	width:100%;
}
.button {
	border: none;
	color: white;
	padding: 15px 32px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin: 4px 2px;
	cursor: pointer;
}

.fa {
	background-color: #008CBA;
	font-size: 20px;
	color: white;
}

.fas {
	background-color: #008CBA;
	font-size: 20px;
	color: white;
}

.button1 {
	background-color: #4CAF50;
} /* Green */
.button2 {
	background-color: #008CBA;
} /* Blue */
.my-notify-warning {
    color: #9F6000;
    background-color: #FEEFB3;
}
</style>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<script src="https://kit.fontawesome.com/a076d05399.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="Cache-Control"
	Content="no-cache,no-store,must-revalidate" />
<meta http-equiv="Pragma" Content="no-cache" />
<meta http-equiv="Expires" Content="0" />
<title>Login</title>
</head>

<body background="/e-sign/res/img/esig.jpg" style="background-repeat: no-repeat;">
<script>
var msg1 = ${msg};
var isuccess=${isuccess};
var dsuccess=${dsuccess};
</script>
	<header> <nav class="navbar navbar-expand-md navbar-dark"
		style="background-color: #008CBA; height:70px;">

	<ul class="navbar-nav">
		<li style="padding-left: 7px;"><a href="fetchDetails"
			class="fas fa-user" class="nav-link"> Account</a></li>
	</ul>

	<ul class="navbar-nav navbar-collapse justify-content-end">
		<li style="padding-left: 7px;"><a href="logout"
			class="fas fa-power-off" class="nav-link"> Logout</a></li>
	</ul>
	</nav> </header>


	<div id="captioncon" style="text-align: center;">
		<caption>
			<h2 style="text-align: center;">Welcome to CalPERS e-Signature portal, ${loginDetails.firstname}. </h2>
			<!--<h2 style="font-style: italic; color: red;">${msg}</h2> 
			 <h2 style="font-style: italic; color: red;">${notexists}</h2> -->
			<h3>${success}</h3>
			<h3>${error}</h3>
			
				
			

		</caption>
		 <div class="my-notify-warning" style="width:100%;float:center;">${msg}</div>
		<!--<c:if test="${not empty msg1}">
 			<div class="my-notify-warning">${msg}</div>
		</c:if>
		<c:if test="${not empty usuccess}">
 			<div class="my-notify-success">${usuccess}</div>
		</c:if> -->
	</div>
<div >

	<div id="imgcont" style="text-align: right;padding-right:150px;padding-top:25px;">
		<img src="data:image/png;base64,${imageDetails}" width="400"
			height="200" />
	</div>

	<br>
	<!--
	<form action="insertImage" modelAttribute="imageDetails" enctype="multipart/form-data" method="post" id="loginForm">

		<pre>
		<h3>${error}</h3>
		<h3>${error }</h3>
			
		<input type="hidden" value="${loginDetails.email}"
        class="form-control" name="email" minlength="5" readonly>
        Photo:		
	 <input type="file" name="image" id="file"> 	
	<input type="submit" value="Submit">

		</pre>

	</form>
	
	  <a href="uploadsignature.jsp">Upload Signature</a>-->
	<div id="btncon" style="text-align: right;padding-right:150px;padding-top:25px;">
		<button class="button button1" href="uploadsignature.jsp"
			onclick="window.location.href='/e-sign/uploadsignature.jsp'">Upload
			Signature</button>
		<button class="button button2" href="drawsign.jsp"
			onclick="window.location.href='/e-sign/drawsign.jsp'">Draw
			Signature</button>

	</div>
</div>
	<div id="footcon" style="padding-bottom: 5px">
		<footer class="footer">
		<p>
			Contact<br> Team PHANTOMS<br> Department of CSc<br>
			California State University, Sacramento.
		</p>
		</footer>
	</div>
	<!--   <iframe src ="uploadsignature.jsp" width="100%" height="1100" frameborder="0px"></iframe> -->
</body>
</html>