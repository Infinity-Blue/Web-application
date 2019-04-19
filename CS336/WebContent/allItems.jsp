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

Application dbb = new Application();
Connection conn = db.getConnection();
Statement stt = con.createStatement();
ResultSet result;
String sql=""; 
/* isdsql is itemiD in Item table that matches type*/
%>
<% 

sql = "select * from Item";


result=st.executeQuery(sql);
while (result.next()) 
{  %> 
	<div class="item">
	<a href="itemDetails.jsp?idItem=<%=result.getString("item_id")%>"><%=result.getString("title")%></a>
	</div>
	<%
}

%>

</body>
</html>