<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css'">
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
    <link rel="stylesheet" href= "https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="Cache-Control"
	Content="no-cache,no-store,must-revalidate" />
<meta http-equiv="Pragma" Content="no-cache" />
<meta http-equiv="Expires" Content="0" />
<style>
body {
	font-family: Arial, Helvetica, sans-serif;
}

.input-icons i { 
            position: absolute; 
        } 
	
	.input-icons { 
            width: 100%; 
            margin-bottom: 10px; 
        } 

	.icon { 
            padding: 20px; 
            min-width: 40px; 
        } 

	.input-field { 
            width: 100%; 
            padding: 10px; 
            Text-align:left; 
        } 
.card {
        margin: 0 auto; /* Added */
        float: none; /* Added */
        margin-bottom: 10px; /* Added */
}
.card-body{
  width:450px; //adjust this value according your requirement
}
input[type=email], input[type=password] {
	width: 100%;
	padding: 18px 40px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid #ccc;
	box-sizing: border-box;
}

button {
	background-color: #4CAF50;
	color: white;
	padding: 14px 20px;
	margin: 8px 0;
	border: none;
	cursor: pointer;
	width: 100%;
}

button:hover {
	opacity: 0.8;
}

.cancelbtn {
	width: auto;
	padding: 10px 18px;
	background-color: #f44336;
}

.imgcontainer {
	text-align: center;
	margin: 24px 0 12px 0;
}

img.avatar {
	width: 40%;
	border-radius: 50%;
}

.container {
	padding: 16px;
}

span.psw {
	float: right;
	padding-top: 16px;
}
.my-notify-info, .my-notify-success, .my-notify-warning, .my-notify-error {
    padding:10px;
    margin:10px 0;
 
}
.my-notify-info:before, .my-notify-success:before, .my-notify-warning:before, .my-notify-error:before {
    font-family:FontAwesome;
    font-style:normal;
    font-weight:400;
    speak:none;
    display:inline-block;
    text-decoration:inherit;
    width:1em;
    margin-right:.2em;
    text-align:center;
    font-variant:normal;
    text-transform:none;
    line-height:1em;
    margin-left:.2em;
    -webkit-font-smoothing:antialiased;
    -moz-osx-font-smoothing:grayscale
}
.my-notify-info:before {
    content:"\f05a";
}
.my-notify-success:before {
    content:'\f00c';
}
.my-notify-warning:before {
    content:'\f071';
}
.my-notify-error:before {
    content:'\f057';
}
.my-notify-info {
    color: #00529B;
    background-color: #BDE5F8;
}
.my-notify-success {
    color: #4F8A10;
    background-color: #DFF2BF;
}
.my-notify-warning {
    color: #9F6000;
    background-color: #FEEFB3;
}
.my-notify-error {
    color: #D8000C;
    background-color: #FFD2D2;
}


/* Change styles for span and cancel button on extra small screens */
@media screen and (max-width: 300px) {
	span.psw {
		display: block;
		float: none;
	}
	.cancelbtn {
		width: 100%;
	}
}

body {
	/background-image: url('/resource/img/bg-yosemite.jpg');/
	background-repeat: no-repeat;
	background-attachment: fixed;
	background-size: cover;
}
</style>
</head>
<body background="/e-sign/res/img/bg-yosemite.jpg">

	<div class="imgcontainer">
        <img src="<c:url value="/res/img/logo.png"/>" alt="Avatar" class="avatar">
    </div>
<script>
var message = ${message};
var success = ${success};
var resFail = ${resfail};
var ressuccess = ${ressuccess};
</script>
	<div class="container">

		<div class="row">
			
				<div class="card">
					<article class="card-body" >
					<c:if test="${not empty message}">
 						<div class="my-notify-error"> ${message}</div>
					</c:if>
					<c:if test="${not empty resFail}">
 						<div class="my-notify-error"> ${resfail}</div>
					</c:if>
					<c:if test="${not empty success}">
 						<div class="my-notify-success">${success}</div>
					</c:if>
					<c:if test="${not empty ressuccess}">
 						<div class="my-notify-success">${ressuccess}</div>
					</c:if>
					 <a href="register"
						class="float-right btn btn-outline-primary">Sign up</a>
					
					<h4 class="card-title mb-4 mt-1" ><strong>Sign in</strong></h4>
					<form id="loginForm" modelAttribute="login" action="loginProcess"
						method="post">
						<div class="form-group">
						<div class="input-icons"> 
							<i class="fa fa-envelope icon"></i>  <input name="email" id="email"
								class="form-control" placeholder="Email" type="email" required>
						</div>
						<!-- form-group// -->
						<div class="form-group">
						<div class="input-icons"> 
							<i class="fa fa-key icon"></i> <input name="password" id="password"
								class="form-control" placeholder="Password" type="password"
								required>
								<a class="fgp" style="color:#4282F4;text-align:center;" href="forgotpassword.jsp">Forgot password?</a> 
						</div>
						<!-- form-group// -->
						<!-- <div class="form-group">
                                <div class="checkbox">
                                    <label> <input type="checkbox"> Save password </label>
                                </div> <!-- checkbox .// -->
				</div>
				</div>	
	
				
				<!-- form-group// -->
				<div class="form-group" style="text-align:center;">
					<button id="login" name="login" type="submit"
						class="btn btn-primary btn-block" style="width:100%;">Login</button>
				</div>
				<!-- form-group// -->
				</form>
				<!-- <div class="container">
        <label for="uname"><b>Username</b></label>
        <input type="text" placeholder="Enter Username" name="uname" required>

        <label for="psw"><b>Password</b></label>
        <input type="password" placeholder="Enter Password" name="psw" required>

        <button type="submit">Login</button>
        <a href="" class="float-right btn btn-outline-primary">Sign up</a>
        <label>
            <input type="checkbox" checked="checked" name="remember"> Remember me
        </label>
    </div>

    <div class="container" style="background-color:#f1f1f1">
        <button type="button" class="cancelbtn">Cancel</button>
        <span class="psw">Forgot <a href="#">password?</a></span>
    </div>
</form>
-->
</body>
</html>
