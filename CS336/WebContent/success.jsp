<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>success</title>
</head>
<body>
<%
    if ((session.getAttribute("user") == null))
    {
%>
You are not logged in<br/>
<a href="login.jsp">Please Login</a>
<%} 
    else {
%>
<!--isplay the username that is stored in the session.  -->
Welcome <%=session.getAttribute("user")%> 
<a href='logout.jsp'>Log out</a>
<%
    }
%>
</body>
</html>