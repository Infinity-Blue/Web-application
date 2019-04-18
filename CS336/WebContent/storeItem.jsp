<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="cs336.pkg.*"%>
  <!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>storeItem</title>
</head>
<body>

<%

String title = request.getParameter("title"); 
String enddate = request.getParameter("enddate"); 
String initialPrice = request.getParameter("initialprice");
String minprice = request.getParameter("minprice");
String category = request.getParameter("category");
String color = request.getParameter("color");
String name = request.getParameter("name");
String age = request.getParameter("age");
String breed = request.getParameter("breed");

ItemUtils.insertItem(title, enddate, initialPrice, minprice, category, color, age, name, breed);


out.println("Item created successfully");
%>

</body>
</html>