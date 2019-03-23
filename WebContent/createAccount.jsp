<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Create Account</title>
</head>
<body>
  <form action="createAccountDetails.jsp" method="POST">
       <!--Login Name is email address-->
       <h1 style="font-size:30px">Create Account</h1>
       Full name <br/> <input type="text" name="Full name"/> <br/>
       Email address <br/><input type="text" name="Login Name"/><br/>
       Password <br/><input type="password" name="password"/> <br/>
       creditCardNumber<br/> <input type="text" name="Creditcard Number"/> <br/>
       Date of birth(YYYYMMDD) <br/><input type="text" name="dateofbirth"/> <br/>
       <input type="submit" value="Submit"/>
       </form>
</body>
</html>
