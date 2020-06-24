<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="Cache-Control"
	Content="no-cache,no-store,must-revalidate" />
<meta http-equiv="Pragma" Content="no-cache" />
<meta http-equiv="Expires" Content="0" />
<title>Login</title>
</head>
<style>
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

.button1 {
	background-color: #4CAF50;
} /* Green */
.button2 {
	background-color: #008CBA;
} /* Blue */

.inputfile {
	width: 0.1px;
	height: 1px;
	opacity: 0;
	overflow: hidden;
	position: absolute;
	z-index: -1;
	margin: 4px 2px;
}
.inputfile + label {
    font-size: 1.25em;
    font-weight: 700;
    color: back;
    background-color: white;
    display: inline-block;
}

.inputfile:focus + label,
.inputfile + label:hover {
    background-color: #87ffaa;
}
.inputfile + label {
	cursor: pointer; /* "hand" cursor */
}
.file-custom{
cursor:pointer
}
.inputfile:focus + label {
	outline: 1px dotted #000;
	outline: -webkit-focus-ring-color auto 5px;
}
</style>
<body>
	<header> <nav class="navbar navbar-expand-md navbar-dark"
		style="background-color: blue">

	<ul class="navbar-nav">
		<li><a href="fetchDetails" class="nav-link">Account</a></li>
	</ul>
	<ul class="navbar-nav">
		<li><a href="drawsign.jsp" class="nav-link">Draw Sign</a></li>
	</ul>
	<ul class="navbar-nav">
		<li><a href="login.jsp" class="nav-link">Home</a></li>
	</ul>
	<ul class="navbar-nav navbar-collapse justify-content-end">
		<li><a href="logout" class="nav-link">Logout</a></li>
	</ul>
	</nav> </header>



	<caption>
	<br>
	<br>
	<br>
		<h4>Welcome ${loginDetails.firstname} Please upload the picture.!</h4>
	</caption>

	<form action="insertImage" modelAttribute="imageDetails"
		enctype="multipart/form-data" method="post" id="loginForm">

		<pre>
		<h3>${success}</h3>
		<h3>${error }</h3>	
		<input type="hidden" value="${loginDetails.email}"
				class="form-control" name="email" minlength="5" readonly>
        <p style="padding-left: 16px; padding-right: 16px; font-size:22px" >
        Please chose a picture and click on submit to save the picture</p>		
	<input class="button button1" type="file" name="image" id="file" > 	<br>
	<input class="button button2" type="submit" value="Submit">
	 
	<!-- <input type="file" name="file1" id="file1" class="inputfile" />
	<label for="file1"><strong>Choose a file</strong></label>  -->
	</pre>
	</form>

	<table align="center">
		<tr>
			<td style="font-style: italic; color: red;">${message}</td>
		</tr>
	</table>

</body>
</html>