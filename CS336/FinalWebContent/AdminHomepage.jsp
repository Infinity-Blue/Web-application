<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Administrator homepage</title>
</head>
<body>
<a href='logout.jsp'>Log out</a> 


		<h1 style="text-align:center; font-size:40px">Administrator Homepage</h1>
		
		<p>
		 <p style="text-align:center; margin:30px"><a style=" color:gray; font-size:40px;text-decoration: none" href='createCustomerRepAcc.jsp'>Want to Create a Customer Representative Account?</a></p>
		  <p style="text-align:center; margin:30px"><a style=" color:gray; font-size:40px;text-decoration: none" href='salesReport.jsp'>Want to create a Sales Report?</a></p>
		   <p style="text-align:center; margin:30px"><a style=" color:gray; font-size:40px;text-decoration: none" href='email.jsp'>Want to send an email?</a></p>

		
		
		</p>

       
       </form>
</body>
</html>