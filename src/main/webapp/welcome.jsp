    <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
             pageEncoding="ISO-8859-1"%>
        <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
        <html>
        <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <meta http-equiv="Cache-Control"
        Content="no-cache,no-store,must-revalidate" />
        <meta http-equiv="Pragma" Content="no-cache" />
        <meta http-equiv="Expires" Content="0" />
        <link rel="stylesheet"
        href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
        crossorigin="anonymous">
        <title>Welcome</title>
        </head>
        <body>
        <header> <nav class="navbar navbar-expand-md navbar-dark"
        style="background-color: tomato">
        <ul class="navbar-nav">
        <li><a href="login.jsp" class="nav-link">Home</a></li>
        </ul>

        <ul class="navbar-nav navbar-collapse justify-content-end">
        <li><a href="logout"
        class="nav-link">Logout</a></li>
        </ul>
        </nav> </header>
        <div class="container col-md-5">
        <div class="card">
        <div class="card-body">

        <form id="welForm" modelAttribute="userDetails" action="updateProcess" method="post" >
        <caption>
        <h2>Welcome ${loginDetails.firstname}</h2>
        <h2>${error }</h2>
        </caption>
        <fieldset class="form-group">
        <label>First Name</label> <input type="text" value="${loginDetails.firstname}"
        class="form-control" name="firstname" required="required"
        minlength="5">
        </fieldset>

        <fieldset class="form-group">
        <label>Last Name</label> <input type="text" value="${loginDetails.lastname}"
        class="form-control" name="lastname" minlength="5">
        </fieldset>
        <fieldset class="form-group">
        <label>Username</label> <input type="text" value="${loginDetails.username}"
        class="form-control" name="username" minlength="5">
        </fieldset>
        <fieldset class="form-group">
        <label>Email</label> <input type="text" value="${loginDetails.email}"
        class="form-control" name="email" minlength="5" readonly>
        </fieldset>
		<fieldset class="form-group">
        <input type="hidden" value="${loginDetails.password}"
        class="form-control" name="password" minlength="5">
        </fieldset>
        <fieldset class="form-group">
        <label>Contact</label> <input type="text" value="${loginDetails.phone}"
        class="form-control" name="phone" minlength="5">
        </fieldset>
        
        <fieldset class="form-group">
        <label>Address</label> <input type="text" value="${loginDetails.address}"
        class="form-control" name="address" minlength="5">
        </fieldset>

		<fieldset class="form-group">
        <label>Organization</label> <input type="text" value="${loginDetails.organization}"
        class="form-control" name="organization" minlength="5">
        </fieldset>
        
        
       <!--  <fieldset class="form-group">
        <label>Date of Birth</label> <input type="date"
        value="<c:out value='${todo.targetDate}' />" class="form-control"
        name="dob" required="required">
        </fieldset>
 		
 		
        <button type="submit" class="btn btn-success">Save</button>-->
        <button class="btn btn-success" id="update" name="update">Save</button>
        </form>
        </div>
        </div>
        </div>

        </body>
        </html>