<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="cs336.pkg.*"%>
  <!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>buyerSeller</title>
<link href="./itemStyle.css" rel="stylesheet" type="text/css">
</head>
<body>
	   <h style="font-size:20px">Search by Seller or Buyer</h>
       <form action="searchByperson.jsp" method="POST">
       <br>Seller<br/><input type="text" name="sellername"/> <br/>
       Buyer<br/> <input type="text" name="buyername"/> <br/>
       <input type="submit" value="Submit"/>
       </form>
</body>
</html>