<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Spring 3, MVC Examples</title>
</head>
<body>
<h1>Spring 3, MVC Examples</h1>
<!-- <ul>
  <li><a href="forms/FormFill.html">Hello World</a></li>
</ul>
<ul>
  <li><a href="forms/Jobs.html">Simple Form</a></li>
</ul> -->
<%-- <jsp:forward page="forms/FormFill.html"></jsp:forward> --%>
<% response.sendRedirect("forms/Scheduler.html"); %>
</body>
</html>