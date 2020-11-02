<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="cs336.pkg.*"%>
  <!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Auto Bidding</title>
<link href="./itemStyle.css" rel="stylesheet" type="text/css">
</head>
<body>
<%  



ResultSet largestCurrentBid; 
ResultSet minPossibleBid; 


Application db = new Application();
Application db2 = new Application();

Connection con = db.getConnection();
Connection con2 = db2.getConnection();


Statement stb = con.createStatement();
Statement stb2 = con2.createStatement();


String price = request.getParameter("bidValue");
String itemID = request.getParameter("idItem");
String user = (String)session.getAttribute("user");
String maxValue = request.getParameter("maxValue");
String incrementValue = request.getParameter("incrementValue");

String type = "auto";


String highestBidQuery = "select MAX(price) as maxPrice from Bid where item_id = '"+itemID+"'";

String minimumPossibleBid = "select Initial_price from Item where item_id = '"+itemID+"'";

largestCurrentBid=stb.executeQuery(highestBidQuery);

minPossibleBid = stb2.executeQuery(minimumPossibleBid);

Double initialPrice = 0.0;
if (minPossibleBid.next())
	initialPrice = minPossibleBid.getDouble("Initial_price");

Double largestBid = 0.0;
if (largestCurrentBid.next())
	largestBid = largestCurrentBid.getDouble("maxPrice");

if ((Double.parseDouble(price) <= largestBid)) {
	%> 
	<div class="item">
	<p>BID FAILED! Please enter a bid higher than <%=largestBid%></p>
	<a href="itemDetails.jsp?idItem=<%=itemID%>">Please click here to return to the item.</a>
	</div>
	<%	
}

else if ((Double.parseDouble(price) < initialPrice)) {
	%> 
	<div class="item">
	<p>BID FAILED! Please enter a bid higher than <%=initialPrice%></p>
	<a href="itemDetails.jsp?idItem=<%=itemID%>">Please click here to return to the item.</a>
	</div>
	<%	
}
else {
String insert = "INSERT INTO Bid (price, item_id, email, bidType, incrementVal, maximumValue)"
		+ "VALUES (?, ?, ?, ?, ?, ?)";


PreparedStatement ps = con.prepareStatement(insert);


ps.setString(1, price);
ps.setInt(2, Integer.parseInt(itemID));
ps.setString(3, user);
ps.setString(4, type);
ps.setDouble(5, Double.parseDouble(incrementValue));
ps.setDouble(6, Double.parseDouble(maxValue));
//Run the query against the DB
ps.execute();
BidUtils.adjustAutoBids(Double.parseDouble(price), Integer.parseInt(itemID), true);

%> 
<div class="item">
<p>Your bid was successful!</p>
<a href="itemDetails.jsp?idItem=<%=itemID%>">Please click here to return to the item.</a>
</div>
<%


}




%>

</body>
</html>