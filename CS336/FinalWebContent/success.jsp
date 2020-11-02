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
<!--Display the username that is stored in the session.  -->

<p>Welcome <%=session.getAttribute("user")%></p>
<p>Click <a style="color:gray" href='logout.jsp'>here</a> to log out!

  <h1 style="text-align:center; font-size:60px">Home Page</h1>
  
<div style="text-align:center margin-left: auto margin-right: auto" class="category">

       <p style="text-align:center; margin:30px"><a style=" color:gray; font-size:40px;text-decoration: none" href='createAuctionItem.jsp'>Put an Animal 4 Auction</a></p>


       <p style="text-align:center; margin:30px"><a style=" color:gray; font-size:40px;text-decoration: none" href='allItems.jsp'>List All Items on PetMe</a></p>

       <p style="text-align:center; margin:30px"><a style=" color:gray; font-size:40px;text-decoration: none" href='Home.jsp'>Search for Items</a></p>

       <p style="text-align:center; margin:30px"><a style=" color:gray; font-size:40px;text-decoration: none" href='questions.jsp'>Questions and Answers</a></p>

	<p style="text-align:center; margin:30px"><a style=" color:gray; font-size:40px;text-decoration: none" href='email.jsp'>Email</a></p>

</div>

<%
    }
%>



</body>
</html>