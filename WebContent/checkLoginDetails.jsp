<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="cs336.pkg.*"%>
  <!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>checkLoginDetails</title>
</head>
<body>
<% 
String userid = request.getParameter("username");   
String pwd = request.getParameter("password");
Application db = new Application();
Connection con = db.getConnection();
Statement st = con.createStatement();
ResultSet result;
result=st.executeQuery("select * from UserAccount where email='" + userid + "' and password='" + pwd + "'");   

if (result.next()) 
    {   
        session.setAttribute("user", userid); // the username will be stored in the session
        out.println("welcome " + userid);
        out.println("<a href='logout.jsp'>Log out</a>");
        response.sendRedirect("success.jsp");
    } else 
    {
        out.println("Invalid password <a href='login.jsp'>try again</a>");
    }

%>


</body>
</html>