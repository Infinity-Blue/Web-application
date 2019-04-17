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
ResultSet result;
String sql=""; 
%>
<% 
String item = request.getParameter("Search");  
String Color=request.getParameter("Color");
String Name=request.getParameter("Name");
String Age=request.getParameter("Age");
String Breed=request.getParameter("Breed"); 
if (item.equals("dog"))
{    
/* 	sql="select title from Item where item_id in (select itemID from Dog)";   */
    sql="select title from Item i inner join Characteristics c on i.item_id=c.itemsId inner join Dog d on c.itemsId=d.itemID where c.colors='"+Color+"' or c.names='"+Name+"' or c.ages='"+Age+"' or c.breeds='"+Breed+"'";  

}
else if (item.equals("cat"))
{
	/* sql="select title from Item where item_id in (select itemID from Cat)"; */
	sql="select title from Item i inner join Characteristics c on i.item_id=c.itemsId inner join Cat ct on c.itemsId=ct.itemID where c.colors='"+Color+"' or c.names='"+Name+"' or c.ages='"+Age+"' or c.breeds='"+Breed+"'"; 
}
else if (item.equals("rabbit"))
{
	/* sql="select title from Item where itme_id in (select itemID from Rabbit)"; */
	sql="select title from Item i inner join Characteristics c on i.item_id=c.itemsId inner join Rabbit r on c.itemsId=r.itemID where c.colors='"+Color+"' or c.names='"+Name+"' or c.ages='"+Age+"' or c.breeds='"+Breed+"'"; 
}
else
{
	out.println("No item");
	response.sendRedirect("noMatch.jsp"); 
	
} 
if(sql!=""){
result=st.executeQuery(sql);
while (result.next()) 
{  %> 
	<div class="item">
	<a href="itemDetails.jsp"><%=result.getString("title")%></a>
	</div>
	<%
}
}
%>

</body>
</html>