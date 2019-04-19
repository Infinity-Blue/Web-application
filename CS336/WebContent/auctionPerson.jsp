<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="cs336.pkg.*"%>
  <!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>auctionPerson</title>
<link href="./itemStyle.css" rel="stylesheet" type="text/css">
</head>
<body>
<!-- view the list of all auctions a specific buyer(bidder)has participated in -->
<%    
String bidder = request.getParameter("biddername");
Application db = new Application();
Connection con = db.getConnection();
Statement st = con.createStatement();
ResultSet result; 
String sql="";
 
sql="select *from Bid b inner join At a on b.bidID=a.bid_id join Has h on h.bid_id= b.bidID inner join UserAccount user on user.email=h.email_address where user.name='"+bidder+"'";
result=st.executeQuery(sql);
/* The following prints the auctionID a specific bidder has participated in*/
while(result.next())
{%> 
	<%=result.getString("auction_id")%>
	<br><%
}
%>
</body>
</html>