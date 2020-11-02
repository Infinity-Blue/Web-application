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
 <form action="success.jsp" method="POST">
<td align="right" style="vertical-align: top;">
            <button style="border: none; background: #404040; color: #ffffff !important; font-weight: 100; padding: 15px; border-radius: 6px" type = "submit" value = "Submit">Home</button>
        </td>
</form>


<%  
Application db = new Application();
Connection con = db.getConnection();
Statement st = con.createStatement();

ResultSet result;
String sql=""; 
/* isdsql is itemiD in Item table that matches type*/
%>
<% 

sql = "select * from Item natural join ItemProperties";


result=st.executeQuery(sql);

%><h1 style="text-align:center; font-size:40px">List of All Items on PetMe</h1><%

while (result.next()) 
{  %> 
	<div style = "margin:20px; text-align:center; font-size:25px" class="item">
		<a style="margin-bottom:20px; text-decoration: none; color:gray" href="itemDetails.jsp?idItem=<%=result.getString("item_id")%>"><b>Title:</b> <%=result.getString("title")%>  <b>Name of Pet:</b> <%=result.getString("name")%> </a>
	
	</div>
	<%
}

%>

</body>
</html>