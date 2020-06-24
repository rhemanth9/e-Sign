<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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

.button1 {background-color: #4CAF50;} /* Green */
.button2 {background-color: #008CBA;} /* Blue */
</style>
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
<body>
	<header> <nav class="navbar navbar-expand-md navbar-dark"
		style="background-color: #008CBA">

	<ul class="navbar-nav">
		<li><a href="fetchDetails" class="nav-link">Account</a></li>
	</ul>
	<ul class="navbar-nav">
		<li><a href="drawsign.jsp" class="nav-link">Draw Sign</a></li>
	</ul>
	<ul class="navbar-nav navbar-collapse justify-content-end">
		<li><a href="logout" class="nav-link">Logout</a></li>
	</ul>
	</nav> </header>



	<caption>
		<h2>Welcome ${loginDetails.firstname}</h2>
		<h2>${message}</h2>
		<h2>${notexists}</h2>
		<img src="data:image/png;base64,${imageDetails}" width="500" height="300"/><br>
	</caption>
	
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
	<button class="button button1" href="uploadsignature.jsp" onclick="window.location.href='/e-sign/uploadsignature.jsp'">Upload Signature</button>
	<button class="button button2" href="drawsign.jsp" onclick="window.location.href='/e-sign/drawsign.jsp'">Draw Signature</button>

	<table align="center">
		<tr>
			<td style="font-style: italic; color: red;">${message}</td>
		</tr>
	</table>

</body>
</html>