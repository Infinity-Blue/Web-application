<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="cs336.pkg.*"%>
  <!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>bidSuccuessful</title>
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
String User = (String)session.getAttribute("user");


String highestBidQuery = "select MAX(price) from Bid where item_id = '"+itemID+"'";

String minimumPossibleBid = "select Initial_price from Item where item_id = '"+itemID+"'";

largestCurrentBid=stb.executeQuery(highestBidQuery);

minPossibleBid = stb2.executeQuery(minimumPossibleBid);

String minBid = "";

if(minPossibleBid.next()){
	minBid += minPossibleBid.getString("Initial_price");
}

String highestBid = null;

if(largestCurrentBid.next()){
 highestBid = largestCurrentBid.getString("MAX(price)");
}


if(highestBid == null){
	
		if((Double.parseDouble(price) > Double.parseDouble(minBid)) ){ /////IF THE ENTERED PRICE IS HIGHER THAN THE HIGHEST BID FOR THE ITEM
			String insert = "INSERT INTO Bid (item_id, price,email)"
			+ "VALUES (?, ?,?)";
			//Create a Prepared SQL statement allowing you to introduce the parameters of the query
			PreparedStatement ps = con.prepareStatement(insert);

			ps.setString(1, itemID);
			ps.setDouble(2, Double.parseDouble(price));
			ps.setString(3, User);

			ps.execute();

			
			BidUtils.adjustAutoBids(Double.parseDouble(price), Integer.parseInt(itemID), false);
		%> 
			<div class="item">
			<p>Your bid was successful!</p>
			<a href="itemDetails.jsp?idItem=<%=itemID%>">Please click here to return to the item.</a>
			</div>
		<%

	}

	else{
	

	%> 
	<div class="item">
	<p>BID FAILED! Please enter a bid higher than <%=minBid%></p>
	<a href="itemDetails.jsp?idItem=<%=itemID%>">Please click here to return to the item.</a>
	</div>
	<%
	
	
	}


	 
}


else {
	
	if(Double.parseDouble(price) > Double.parseDouble(highestBid)){
	String insert = "INSERT INTO Bid (item_id, price,email)"
			+ "VALUES (?, ?,?)";
			//Create a Prepared SQL statement allowing you to introduce the parameters of the query
			PreparedStatement ps = con.prepareStatement(insert);

			ps.setString(1, itemID);
			ps.setDouble(2, Double.parseDouble(price));
			ps.setString(3, User);

			ps.execute();

			
			BidUtils.adjustAutoBids(Double.parseDouble(price), Integer.parseInt(itemID), false);
			
			%> 
				<div class="item">
				<p>Your bid was successful!</p>
				<a href="itemDetails.jsp?idItem=<%=itemID%>">Please click here to return to the item.</a>
				</div>
			<%
	
	}
	
	else{
		
		%> 
		<div class="item">
		<p>BID FAILED! Please enter a bid higher than <%=highestBid%></p>
		<a href="itemDetails.jsp?idItem=<%=itemID%>">Please click here to return to the item.</a>
		</div>
		<%
		
		
	}
	
}




%>

</body>
</html>