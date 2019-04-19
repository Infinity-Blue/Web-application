<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="cs336.pkg.*"%>
  <!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>itemDetails</title>
<link href="./itemStyle.css" rel="stylesheet" type="text/css">
</head>
<body>
<!-- view all the history of bids for any specific auction
view the list of all auctions a specific buyer or seller has participated in
view the list of "similar" items on auctions in the preceding month (and auction information about them) -->
<%
Timefunction time=new Timefunction();
String id = request.getParameter("idItem"); %>
<a href="historyOfbid.jsp?itID=<%=request.getParameter("idItem")%>">the history of bid</a><br>
<% 
Application db = new Application();
Connection con = db.getConnection();
Statement st = con.createStatement();
String sql="";
 /* check enddate of the auction  */
sql="select end_date from Item where item_id='"+id+"'";
ResultSet rs=st.executeQuery(sql);
	if(rs.next())
	{   
		out.println(time.compareTime(rs.getString("end_date"))); 
	}
%>


</body>
</html>