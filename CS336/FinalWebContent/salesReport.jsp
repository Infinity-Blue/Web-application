<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="cs336.pkg.*"%>
  <!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Sales Report</title>
<link href="./itemStyle.css" rel="stylesheet" type="text/css">

</head>
<body>
<a href='logout.jsp'>Log out</a> 
 <form action="AdminHomepage.jsp" method="POST">
<td align="right" style="vertical-align: top;">
            <button style="border: none; background: #404040; color: #ffffff !important; font-weight: 100; padding: 15px; border-radius: 6px" type = "submit" value = "Submit">Home</button>
        </td>
</form>


<%
ResultSet totalEarnings;

Application db = new Application();
Connection con = db.getConnection();
Statement st = con.createStatement();


String getTotalEarnings = "select SUM(maxprice) from (select item_id, max(price) as maxprice from Item natural join Bid group by item_id) as A";

totalEarnings=st.executeQuery(getTotalEarnings);

if(totalEarnings.next())
{
	%>
	<p style="font-size:40px">Total Earnings:</p>
	
	<div style = "margin:40px" class = "item">
	<p style="font-size:30px" >$<%=totalEarnings.getString("sum(maxprice)") %></p>
	</div>
	<%
}

%>




<%
//////////////////////////////////////////////////////////////////////////////////////
ResultSet earningsPer;

Application db2 = new Application();
Connection con2 = db.getConnection();
Statement st2 = con.createStatement();


String getEarningsPer = "select *, max(price) from Item natural join Bid group by item_id";

earningsPer=st.executeQuery(getEarningsPer);

%><p style="font-size:40px">Earnings per Item:</p><%

while(earningsPer.next())
{
	%>
	<div style = "margin:40px" class = "item">
	<p style="font-size:30px">Item Title: <%=earningsPer.getString("title") %></p>
	<p>Item Type: <%=earningsPer.getString("category") %></p>
	<p>Highest Bid: $<%=earningsPer.getString("max(price)") %></p>
	<p>User who bought the item: <%=earningsPer.getString("email") %></p>
	
	
	</div>
	<%
}

////////////////////////////////////////////////////////////////////////////////////////////
%>

<%
ResultSet bestBuyers;

Application db3 = new Application();
Connection con3 = db.getConnection();
Statement st3 = con.createStatement();


String getBestBuyers = "select* from (select *, max(price) as maxprice from Item natural join Bid group by item_id) as W order by maxprice desc limit 3;";

bestBuyers=st.executeQuery(getBestBuyers);

%><p style="font-size:40px">Top 3 Highest Buyers:</p><%

int people = 1;

while(bestBuyers.next())
{
	%>
	<div style = "margin:40px" class = "item">
	<p style="font-size:30px">Number <%=people%></p>
	<p style="font-size:25px">User: <%=bestBuyers.getString("email") %></p>
	<p style="font-size:30px">User's Highest Bid: $<%=bestBuyers.getString("maxprice") %></p>
	
	
	</div>
	<%
	people ++;
}


%>



</body>
</html>