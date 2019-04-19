<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="cs336.pkg.*"%>
  <!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>homepage</title>
<link href="./itemStyle.css" rel="stylesheet" type="text/css">
</head>
<body>
<!-- <p style="text-align:right"><a href="login.jsp">Login</a></p> -->
<%
    if ((session.getAttribute("user") == null))
    {
%>
<a href="login.jsp">Login</a>
<%} 
    else {
%>
<a href='logout.jsp'>Log out</a> 
<% 
    }
%>
<%
/* String item = request.getParameter("Search");    */

/* String sql="";  */
%>
<div style="text-align:center margin-left: auto margin-right: auto" class="category">
<form action="searchItem.jsp" method="POST">
       Title: <input type="text" name="Search" placeholder="'Cat', 'Dog', or 'Rabbit'" required/> <br/>
       Color: <input type="text" name="Color" placeholder="ex: red, blue" /> <br/>
       Name: <input type="text" name="Name" placeholder="ex: Pluto" /> <br/>
       Age: <input type="text" name="Age" placeholder="ex: 9" /> <br/>
       Breed: <input type="text" name="Breed" placeholder="ex: Poodle" /> <br/>
       <input type="submit" value="search"/></form>
</div>

</body>
</html>