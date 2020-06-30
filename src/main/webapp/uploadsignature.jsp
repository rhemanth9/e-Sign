<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link class="jsbin" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />
<script class="jsbin" src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script class="jsbin" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.0/jquery-ui.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/cropperjs/1.5.7/cropper.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://kit.fontawesome.com/a076d05399.js"></script>
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/cropperjs/1.5.7/cropper.min.js"></script> -->
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
.continue {
  font: bold 11px Arial;
  text-decoration: none;
  background-color: #EEEEEE;
  color: #333333;
  padding: 2px 6px 2px 6px;
  border-top: 1px solid #CCCCCC;
  border-right: 1px solid #333333;
  border-bottom: 1px solid #333333;
  border-left: 1px solid #CCCCCC;
}
.fa{
background-color: #008CBA;
font-size: 20px;
color: white;

}

.fas{
background-color: #008CBA;
font-size: 20px;
color: white;

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

.button1 {
	background-color: #4CAF50;
} /* Green */
.button2 {
	background-color: #008CBA;
} /* Blue */
.hide{
display:none;
}
.li{
padding-left:5px;
}
.inputfile {
	width: 0.1px;
	height: 1px;
	opacity: 0;
	overflow: hidden;
	position: absolute;
	z-index: -1;
	margin: 4px 2px;
}

.inputfile+label {
	font-size: 1.25em;
	font-weight: 700;
	color: back;
	background-color: white;
	display: inline-block;
}

.inputfile:focus+label, .inputfile+label:hover {
	background-color: #87ffaa;
}

.inputfile+label {
	cursor: pointer; /* "hand" cursor */
}

.file-custom {
	cursor: pointer
}

.inputfile:focus+label {
	outline: 1px dotted #000;
	outline: -webkit-focus-ring-color auto 5px;
}
</style>
<script>

function readURL(input) {
	result = document.querySelector('.result');
	var cropper = '';
    if (input.files && input.files[0]) {
        var reader = new FileReader();

        reader.onload = function (e) {
        	
        	var img = document.createElement('img');
			img.id = 'image';
			img.src = e.target.result;
			img.width = 150;
			img.height=200;
			
			alert("after");
            $('#blah')
                .attr('src', e.target.result)
                .width(150)
                .height(200);
             // clean result before
				result.innerHTML = '';
               
				// append new image
        result.appendChild(img);
       
				// show save btn and options
          //  cropper = new Cropper(img);
            alert("before");
        };

        reader.readAsDataURL(input.files[0]);
       save =  document.querySelector('.button2');
        save.classList.remove('hide');
        show = document.querySelector('.options');
        show.classList.remove('hide');
    }
    
    
}

/*const btnShow = document.getElementById('file');
btnShow.addEventListener('click',()=> {
options.classList.remove('hide');

});*/
</script>
<body>
	<header>
	 <nav class="navbar navbar-expand-md navbar-dark"
		style="background-color: #008CBA; height:70px;" >
	<ul class="navbar-nav">
	
	<li ><a href="login.jsp" class="fa fa-home" class="nav-link"> Home  </a></li>
	
		
	</ul>
	<ul class="navbar-nav">
		<li style="padding-left:7px;"> <a href="fetchDetails" class="fas fa-user" class="nav-link"> Account  </a></li>
	</ul>
	<ul class="navbar-nav">
		<li style="padding-left:7px;"><a href="drawsign.jsp"  class="fas fa-marker" class="nav-link"> Draw Sign </a></li>
	</ul>

	<ul class="navbar-nav navbar-collapse justify-content-end">
		<li style="padding-left:7px;"><a href="logout" class="fas fa-power-off" class="nav-link"> Logout</a></li>
	</ul>
	</nav> </header>


<div id="captioncont"  style="text-align: center;">
	<caption>
		<br> <br> <br>
		<h4>Welcome ${loginDetails.firstname} Please upload the picture.!</h4>
		<h3>${success}</h3>
		<h3>${error }</h3>
	</caption>
	<br>
	<p style="padding-left: 16px; padding-right: 16px; font-size: 22px">
        Please chose a picture and click on submit to save the picture</p>	
</div>
</div>	
	<div class="options hide" style="text-align: center;">
	<img  class="cropped"id="blah" src="#" alt="your image" />
	</div>
	<br>
	<br>
<input type="hidden" value="${loginDetails.email}"
				class="form-control" name="email" minlength="5" readonly> 
				
<div id="formcont"  style="text-align: center;">
	<form action="insertImage" modelAttribute="imageDetails"
		enctype="multipart/form-data" method="post" id="loginForm">
     <input type="hidden" value="${loginDetails.email}"
				class="form-control" name="email" minlength="5" readonly>   	
	 <input class="button button1" type="file" name="image" id="file"
				accept="image/*" data-type='image' onchange="readURL(this)" required /> 	<br>
	<!-- <div class="box-2">
		<div class="result"></div>
	</div> -->
	<br>
	<input class="button button2 hide" type="submit" value="Submit">	 
	<!-- <input type="file" name="file1" id="file1" class="inputfile" />
	<label for="file1"><strong>Choose a file</strong></label>  -->
	
	</form>
	<!-- <a href="insertImage" class="button">Continue</a> -->
	<table align="center">
		<tr>
			<td style="font-style: italic; color: red;">${message}</td>
		</tr>
	</table>

</body>
</html>