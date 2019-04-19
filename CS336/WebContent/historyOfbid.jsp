<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="cs336.pkg.*"%>
  <!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>historyofBid</title>
<link href="./itemStyle.css" rel="stylesheet" type="text/css">
</head>
<body>
<!-- view all the history of bids for any specific auction -->
<%    
String idItem = request.getParameter("itID");
Application db = new Application();
Connection con = db.getConnection();
Statement st = con.createStatement();
ResultSet result; 

Application dbb = new Application();
Connection conn = dbb.getConnection();
Statement stt = conn.createStatement();
ResultSet resultset; 

Application dbs = new Application();
Connection cons = dbs.getConnection();
Statement sts = cons.createStatement();
ResultSet resultsets; 

String sql_name="";
String sql_bid="";
String sql_price="";
%>
<table border="1">
<tr>
<th>Name</th>
<th>BidID</th>
<th>Bidding price</th>
</tr>

<% 
sql_bid="select * from At a inner join Auction_in auc on a.auction_id=auc.auction_id and auc.Items_id='"+idItem+"' and a.item_idd='"+idItem+"'";
sql_name="select * from UserAccount user inner join Has h on user.email=h.email_address inner join At a on h.bid_id=a.bid_id and a.item_idd='"+idItem+"'";
sql_price="select * from Bid b inner join At a on a.bid_id=b.bidID and a.item_idd='"+idItem+"'";
result=st.executeQuery(sql_bid); 
resultset=stt.executeQuery(sql_name); 
resultsets=sts.executeQuery(sql_price); 

while (resultset.next() && result.next() && resultsets.next()) 
{  %> 
<tr>  
	<!-- Name is the link to the list of auctions the bidder has participated in. -->
	<!-- pass the name of bidder as biddername by clicking hyperlink which opens auctionPerson.jsp and pass biddername to auctionPerson.jsp-->
    <td><a href="auctionPerson.jsp?biddername=<%=resultset.getString("name")%>"><%=resultset.getString("name")%></a></td>
	<td><%=result.getString("bid_id")%></td>
    <td><%=resultsets.getString("price")%></td>
</tr> 
<%} 

%>




</body>
</html>