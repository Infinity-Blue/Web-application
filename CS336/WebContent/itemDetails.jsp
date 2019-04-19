<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>searchItem</title>
<link href="./itemStyle.css" rel="stylesheet" type="text/css">
</head>
<body>




	<a href="historyOfbid.jsp?itID=<%=request.getParameter("idItem")%>">the
		history of bid</a>
<%
Application db = new Application();
Connection con = db.getConnection();
Statement st = con.createStatement();

Application dbb = new Application();
Connection conn = db.getConnection();
Statement stt = con.createStatement();
ResultSet result;
String sql= "";

String itID = request.getParameter("idItem");




sql = "select * from Item where item_id = '" + itID + "'";

result=st.executeQuery(sql);
while (result.next()) 
{  %> 
	<div class="item">Category:
	<a<%=result.getString("item_id")%>><%=result.getString("category")%></a>
	</div>
	<div class="item">Name:
	<a<%=result.getString("item_id")%>><%=result.getString("title")%></a>
	</div>
	<div class="item">Starting Price:
	<a<%=result.getString("item_id")%>><%=result.getString("Initial_price")%></a>
	</div>
	<div class="item">End Date:
	<a<%=result.getString("item_id")%>><%=result.getString("end_date")%></a>
	</div>
	<%
}


sql = "select * from ItemProperties where item_id = '" + itID + "'";

result=st.executeQuery(sql);
while (result.next()) 
{  %> 
	<div class="item">Color:
	<a<%=result.getString("item_id")%>><%=result.getString("color")%></a>
	</div>
	<div class="item">Breed:
	<a<%=result.getString("item_id")%>><%=result.getString("breed")%></a>
	</div>
	<div class="item">Name:
	<a<%=result.getString("item_id")%>><%=result.getString("name")%></a>
	</div>
	<div class="item">Age:
	<a<%=result.getString("item_id")%>><%=result.getString("age")%></a>
	</div>
	<%
}


%>
</body>
</html>