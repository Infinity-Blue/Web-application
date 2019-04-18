<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Forum</title>
</head>
<body>
       <form action="forumDetails.jsp" method="POST">
       What is your question? <br/><textarea name = "question" id="myTextArea" rows="4" cols="20"></textArea><br/>
       Name <br/> <input type="text" name="name"/> <br/>
       Email <br/> <input type="text" name="email"/> <br/>
       <input type="submit" value="Submit"/>
       <a href='questions.jsp'>See already asked questions</a>
       </form>
</body>
</html>