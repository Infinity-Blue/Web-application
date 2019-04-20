<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="cs336.pkg.*"%>
  <!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>searchItem</title>
<link href="./itemStyle.css" rel="stylesheet" type="text/css">
</head>
<body>
<%  
Application db = new Application();
Connection con = db.getConnection();
Statement st = con.createStatement();
ResultSet result;
String sql=""; 
String nameofSeller = request.getParameter("sellername");  
String nameofBuyer =request.getParameter("buyername");

if(nameofBuyer.isEmpty()){
	sql="select *from UserAccount user inner join Sells ss on user.email=ss.email_address inner join Item i on ss.item_ids=i.item_id and user.name='"+nameofSeller+"'"; 
}
else {
	sql="select *from UserAccount user inner join Has h on h.email_address=user.email inner join At a on a.bid_id=h.bid_id inner join Item i on i.item_id=a.item_idd and user.name='"+nameofBuyer+"'"; 

}
result=st.executeQuery(sql);
while(result.next())
{%>
<div class="item">
<a href="itemDetails.jsp?idItem=<%=result.getString("item_id")%>"><%=result.getString("title")%></a>
</div><%
}
%>
