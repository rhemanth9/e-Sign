<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css'">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<link rel="stylesheet" type="text/css" href="/e-sign/res/css/icon.css">
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
/* form {border: 3px solid #f1f1f1;}*/
.input-icons i { 
            position: absolute; 
        } 
	
	.input-icons { 
            width: 100%; 
            margin-bottom: 10px; 
        } 

	.icon { 
            padding: 18px; 
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

.card-body{
  width:450px; adjust this value according your requirement
}

body {
	/*  background-image: url('bg-yosemite.jpg'); */
	background-repeat: no-repeat;
	background-attachment: fixed;
	background-size: cover;
}
</style>
</head>
<script>
var success=${success };
var error= ${error };
var errorexp=${errorexp };
</script>
<body background="/e-sign/res/img/bg-yosemite.jpg">
	<div class="imgcontainer">
		<img src="<c:url value="/res/img/logo.png"/>" alt="Avatar"
			class="avatar">
	</div>
	<div class="container">

		<div class="row">
				<div class="card">
					<article class="card-body">
						<c:if test="${not empty error}">
						<div class="my-notify-success">${error}</div>
					</c:if> <c:if test="${not empty errorexp}">
						<div class="my-notify-error">${errorexp}</div>
					</c:if> 
					<c:if test="${not empty success}">
						<div class="my-notify-success">${success}</div>
					</c:if>
					<form id="forgotPassword" modelAttribute="email"
						action="forgotPassword" method="post">
						<div class="form-group">
							<h4 class="card-title mb-4 mt-1" ><strong>Your Email</strong></h4>
							<div class="input-icons"> 
            		<i class="fa fa-envelope icon"></i>
							 <input name="email" id="email"
								class="form-control" placeholder="Email" type="email" required>
							<!-- form-group// -->
					</div>
						</div>
						<!-- form-group// -->
						<div class="form-group">
							<button id="login" name="login" type="submit"
								class="btn btn-primary btn-block">Submit</button>
						</div>
						<!-- form-group// -->
						<div class="container signin">
							<p>
								Remember the password.? <a href="home.jsp">Sign in</a>.
							</p>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>