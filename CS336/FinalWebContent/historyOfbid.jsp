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


//String sql_name="";
String sql_bid="";
//String sql_price="";


sql_bid = "select * from UserAccount join Bid using (email) where item_id = '"+idItem+"' order by price desc";
result=st.executeQuery(sql_bid); 



if (result.next()) 
{  
	%><p style="text-align:center; font-size:40px; margin-bottom:40px">Item ID: <b><%=result.getString("item_id")%></b></p>
	<div style="text-align:center;margin:30px" class = "item">
    <p>Name of Bidder: <%=result.getString("name")%></p>
    <p>Bid Amount: $<%=result.getString("price")%></p>
    <%


	while(result.next()){%> 
   <p>___________________________________________________________________</p>
 	<div style="text-align:center;margin:30px" class = "item">
 	
    <p>Name of Bidder: <%=result.getString("name")%></p>
    <p>Bid Amount: $<%=result.getString("price")%></p>
    </div>
   <%
	}
} 


%>
</body>
</html>