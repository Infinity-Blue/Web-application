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

  <a href='logout.jsp'>Log out</a> 
<body>

	   <h1 style="text-align:center; font-size:30px">Customer Rep Home Page</h1>
	    <p style="text-align:center; margin:30px"><a style=" color:gray; font-size:40px;text-decoration: none" href='answerQuestions.jsp'>Want to answer questions?</a></p>
  	    <p style="text-align:center; margin:30px"><a style=" color:gray; font-size:40px;text-decoration: none" href='email.jsp'>Want to send an email?</a></p>
        <div style="text-align:center; font-size:20px">
      
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
	<div style = "margin:20px; text-align:center; font-size:25px" class="item">
	<a style="margin-bottom:20px; text-decoration: none; color:gray" href="itemDetails.jsp?idItem=<%=result.getString("item_id")%>"><%=result.getString("title")%></a>
	<form action="deleteItem.jsp?idItem=<%=result.getString("item_id")%>" method = "POST">
  	 <button style="border: none; background: #404040; color: #ffffff !important; font-weight: 100; padding: 15px; border-radius: 6px" type="submit" value="Submit"/>Delete</button>
 
	</form>
	
	</div>
	<%
}

%>

</body>
</html>