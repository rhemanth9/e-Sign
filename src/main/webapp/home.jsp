<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
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


input[type=text], input[type=password] {
	width: 100%;
	padding: 12px 20px;
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
	/*background-image: url('/resource/img/bg-yosemite.jpg');*/
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

	<div class="container">

		<div class="row">
			<div class="col-sm-auto" style="padding-left: 350px;">
				<div class="card">
					<article class="card-body" > <a href="register"
						class="float-right btn btn-outline-primary">Sign up</a>
					<h4>${Success}</h4>
					<h4>${message }</h4>
					<h4>${resfail}</h4>
					<h4>${ressuccess}</h4>
					<h4 class="card-title mb-4 mt-1">Sign in</h4>
					<form id="loginForm" modelAttribute="login" action="loginProcess"
						method="post">
						<div class="form-group">
							<label>Your email</label> <input name="email" id="email"
								class="form-control" placeholder="Email" type="email" required>
						</div>
						<!-- form-group// -->
						<div class="form-group">
							<a class="float-right" href="forgotpassword.jsp">Forgot?</a> <label>Your
								password</label> <input name="password" id="password"
								class="form-control" placeholder="password" type="password"
								required>
						</div>
						<!-- form-group// -->
						<!-- <div class="form-group">
                                <div class="checkbox">
                                    <label> <input type="checkbox"> Save password </label>
                                </div> <!-- checkbox .// -->
				</div>
				<!-- form-group// -->
				<div class="form-group">
					<button id="login" name="login" type="submit"
						class="btn btn-primary btn-block">Login</button>
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

