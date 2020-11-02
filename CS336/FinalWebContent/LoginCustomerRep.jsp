<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Customer Representative Login Form</title>
</head>
<body>

       <h1 style="text-align:center; font-size:40px">Customer Representative Login</h1>

       <form action="checkCustomerRep.jsp" method="POST">
       
              <div style="text-align:center; font-size:20px">
       
       Email Address: <br/><input style="margin-bottom:20px" type="text" name="username"/> <br/>
       Password: <br/> <input style="margin-bottom:20px" type="password" name="password"/> <br/>
       <button style="border: none; background: #404040; color: #ffffff !important; font-weight: 100; padding: 15px; border-radius: 6px" type="submit" value="Submit"/>Log In</button>
      
      </div>
       </form>
</body>
</html>