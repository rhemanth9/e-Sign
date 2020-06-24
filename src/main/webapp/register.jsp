<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<html>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous"><script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
        body {font-family: Arial, Helvetica, sans-serif;}
        form {border: 3px solid #f1f1f1;}

        input[type=text], input[type=password] {
            width: 90%;
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
            width: 90%;
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
            background-image: url('bg-yosemite.jpg');
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
        b{
            font-size: x-large;
        }
    </style>
</head>
<body>

<div class="imgcontainer">
    <img src="../images/logo.png"> 
</div>
<div class="container" style="width:800px; height: 800px;">
<form id="regForm" modelAttribute="user" action="registerProcess" method="post">
   <div class="row" >
        <div class="col-sm-auto" style="align-content: center;width: 100%">
            <div class="card" style="align-content: center; width: 100%">
                <article class="card-body">
                    <div class="container"  >
                    	<h4>${error}</h4>
                        <h1>Register</h1>
                        
                        <label path="username">Username</label>
                        <input path="username" type="text" placeholder="Enter User Name" name="username" id="username" required>
                        
                        <label for="firstname" path="username"><b>First Name</b></label>
                        <input path="username" type="text" placeholder="Enter First Name" name="firstname" id="firstname" required>

                        <label for="lastname" path="lastname"><b>Last Name</b></label>
                        <input type="text" path="lastname" placeholder="Enter Last Name" name="lastname" id="lastname" required>

                       <label for="address" path="address"><b>Address</b></label>
                        <input type="text" path="address" placeholder="Enter Address" name="address" id="address" required>
                        
                        <label for="phone" path="phone"><b>Contact</b></label>
                        <input type="text" path="phone" placeholder="Enter phone number" name="phone" id="phone" required>

                        <label for="email" path="email"><b>Email</b></label>
                        <input type="text" path="email" placeholder="Enter Email" name="email" id="email" required>

                        <label for="password" path="password"><b>Password</b></label>
                        <input type="password" path="password" placeholder="Enter Password" name="password" id="password" required>

                        <label for="confirmpassword" path="confirmpassword"><b>Confirm Password</b></label>
                        <input type="password" path="confirmpassword" placeholder="Confirm Password" name="confirmpassword" id="confirmpassword" required>
                       <!-- <label for="img"><b>Upload Signature</b></label>
                        <br>
                        <input type="file" id="img" name="img" accept="image/*">-->
						<label for="organization" path="email"><b>Organization</b></label>
                        <input type="text" path="organization" placeholder="Enter organization" name="organization" id="organization" required>
                        <hr>
                        <p>By creating an account you agree to our <a href="#">Terms & Privacy</a>.</p>

                        <button class="registerbtn" id="register" name="register">Register</button>
                        <div class="container signin">
                            <p>Already have an account? <a href="home.jsp">Sign in</a>.</p>
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