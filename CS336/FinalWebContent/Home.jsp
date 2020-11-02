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

       <h1 style="margin-bottom:2px; text-align:center; font-size:40px">Item Search</h1>
	       <p style="text-align:center;color:gray">Please enter characteristics to search for a specific pets that matches all of the requirements</p>
	

<div style="text-align:center; font-size:20px">

<form action="searchItem.jsp" method="POST">
       Category:<br/> <input style="margin-bottom:20px" type="text" name="Search" placeholder="'Cat', 'Dog', or 'Rabbit'" required/> <br/>
       Color: <br/><input style="margin-bottom:20px" type="text" name="Color" placeholder="ex: Red, blue" /> <br/>
       Name: <br/> <input style="margin-bottom:20px" type="text" name="Name" placeholder="ex: Milo" /> <br/>
       Age: <br/><input style="margin-bottom:20px" type="text" name="Age" placeholder="ex: 9" /> <br/>
       Breed: <br/><input style="margin-bottom:20px" type="text" name="Breed" placeholder="ex: Poodle" /> <br/>
       <button style="margin:20px;border: none; background: #404040; color: #ffffff !important; font-weight: 100; padding: 15px; border-radius: 6px" type="submit" value="Submit"/>Search</button>

       
</div>

</body>
</html>