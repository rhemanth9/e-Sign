<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="Cache-Control" Content="no-cache,no-store,must-revalidate"/>
		<meta http-equiv="Pragma" Content="no-cache"/>
		<meta http-equiv="Expires" Content="0"/>
</head>
<body>
<%
HttpSession newsession = request.getSession(true);
   newsession.invalidate();
response.sendRedirect("home.jsp");
%>
</body>
</html>