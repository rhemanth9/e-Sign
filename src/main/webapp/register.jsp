<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
	<link rel="stylesheet" type="text/css" href="/e-sign/res/css/icon.css">
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
body {
	font-family: Arial, Helvetica, sans-serif;
}

form {
	border: 3px solid #f1f1f1;
}

.input-icons i {
	position: absolute;
}

.input-icons {
	width: 100%;
	margin-bottom: 10px;
}

.icon {
	padding: 24px;
	min-width: 40px;
}

.input-field {
	width: 100%;
	padding: 10px;
	Text-align: left;
}

input[type=text], input[type=password], input[type=email] {
	width: 100%;
	padding: 11px 50px;
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
.required
{
    color: red;
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
	/*background-image: url('bg-yosemite.jpg');*/
	background-repeat: no-repeat;
	background-attachment: fixed;
	background-size: cover;
}

label, input {
	display: block;
}

label {
	margin-top: 20px;
	margin-bottom: 20px;
}

b {
	font-size: x-large;
}
.modal {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1; /* Sit on top */
            padding-top: 100px; /* Location of the box */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
        }

        /* Modal Content */
        .modal-content {
            background-color: #fefefe;
            margin: auto;
            padding: 20px;
            border: 1px solid #888;
            width: 80%;
        }

        /* The Close Button */
        .close {
            color: #aaaaaa;
            float: left;
            font-size: 28px;
            font-weight: bold;
        }

        .close:hover,
        .close:focus {
            color: #000;
            text-decoration: none;
            cursor: pointer;
        }
</style>
</head>
<body background="/e-sign/res/img/bg-yosemite.jpg">

	<div class="imgcontainer">
		<img src="<c:url value="/res/img/logo.png"/>" alt="Avatar"
			class="avatar" />
	</div>
	<div class="container" style="width: 800px; height: 800px;">
		<form id="regForm" modelAttribute="user" action="registerProcess"
			method="post">
			<div class="row">
				<div class="col-sm-auto" style="width: 100%">
					<div class="card" style="width: 100%">
						<article class="card-body">
							<div class="container">
								<c:if test="${not empty error}">
									<div class="my-notify-error">${error}</div>
								</c:if>
								<h1>Register</h1>

								<!-- <label path="username">Username</label>
                        <input path="username" type="text" placeholder="Enter User Name" name="username" id="username" required> -->

								<div class="input-icons">
									<i class="fa fa-user icon"></i> <input path="firstname"
										type="text" placeholder="Enter First Name" name="firstname"
										id="firstname" required>

									<div class="input-icons">
										<i class="fa fa-user icon"></i> <input type="text"
											path="lastname" placeholder="Enter Last Name" name="lastname"
											id="lastname">

										<div class="input-icons">
											<i class="fa fa-envelope icon"></i> <input type="email"
												path="email" placeholder="Enter Email" name="email"
												pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" id="email"
												required>

											<div class="input-icons">
												<i class="fa fa-envelope icon"></i> <input type="email"
													path="confirmEmail" placeholder="Confirm Email"
													name="confirmEmail"
													pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$"
													id="confirmEmail" required>

												<div class="input-icons">
													<i class="fa fa-key icon"></i> <input type="password"
														path="password" placeholder="Enter Password"
														name="password" id="password"
														pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
														title="Must contain at least one  number and one uppercase and lowercase letter, and at least 8 or more characters"
														required>

													<div class="input-icons">
														<i class="fa fa-key icon"></i> <input type="password"
															path="confirmpassword" placeholder="Confirm Password"
															name="confirmpassword" id="confirmpassword"
															pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
															title="Must contain at least one  number and one uppercase and lowercase letter, and at least 8 or more characters"
															required>
<!-- 
														<div class="input-icons">
															<i class="fa fa-address-book icon"></i> <input
																type="text" path="address" placeholder="Enter Address"
																name="address" id="address" >

															<div class="input-icons">
															
																<i class="fa fa-mobile w3-xlarge icon"padding: 40px; ></i>
																<input type="text" path="phone"
																	placeholder="Enter phone number" name="phone"
																	id="phone" >


																
																<div class="input-icons">
																	<i class="fa fa-university icon"></i> <input
																		type="text" path="organization"
																		placeholder="Enter organization" name="organization"
																		id="organization" > -->
																	<hr>
																	<p>
																		By creating an account you agree to our <!-- Trigger/Open The Modal -->
                                <a id="myBtn" style="font-size: large;text-decoration: underline;color: blue;cursor:pointer;">Terms and Condintions</a>

                                <!-- The Modal -->
                                <div id="myModal" class="modal"  >

                                    <!-- Modal content -->
                                    <div class="modal-content">
                                        <span class="close">&times;</span>
                            <p>Some text in the Modal..</p>
                                    </div>

                                </div>

                            <script>
                    // Get the modal
                            var modal = document.getElementById("myModal");

                    // Get the button that opens the modal
                            var btn = document.getElementById("myBtn");

                    // Get the <span> element that closes the modal
                             var span = document.getElementsByClassName("close")[0];

                    // When the user clicks the button, open the modal
                            btn.onclick = function() {
                                modal.style.display = "block";
                            }

                    // When the user clicks on <span> (x), close the modal
                            span.onclick = function() {
                                modal.style.display = "none";
                            }

                    // When the user clicks anywhere outside of the modal, close it
                             window.onclick = function(event) {
                                if (event.target == modal) {
                                    modal.style.display = "none";
                                }
                            }
                            </script>
																	

																	<button class="registerbtn" id="register"
																		name="register">Register</button>
																	<div class="container signin">
																		<p>
																			Already have an account? <a href="home.jsp">Sign
																				in</a>.
																		</p>
																	</div>
																</div>
						</article>
					</div>
				</div>
			</div>
		</form>
	</div>


</body>
</html>