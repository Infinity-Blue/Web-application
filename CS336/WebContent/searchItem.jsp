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
ResultSet resultset;
String sql=""; 
/* isdsql is itemiD in Item table that matches type*/
String idsql="";
%>
<% 
String Category = request.getParameter("Search");  
String Color=request.getParameter("Color");
String Name=request.getParameter("Name");
String Age=request.getParameter("Age");
String Breed=request.getParameter("Breed"); 

String empty = "";

sql = "select * from Item natural join ItemProperties where";

	
if (!(Category.equals(empty))){
	
	sql = sql + " category = '"+Category+"'";
}

if (!(Color.equals(empty))){
	
	sql = sql + " and color = '"+Color+"'";
}

if (!(Name.equals(empty))){
	
	sql = sql + " and name = '"+Name+"'";
}

if (!(Age.equals(empty))){
	
	sql = sql + " and age = '"+Age+"'";
}

if (!(Breed.equals(empty))){
	
	sql = sql + " and breed = '"+Breed+"'";
}



if(sql!=""){
	
result=st.executeQuery(sql);

if(result.first()){
	
	%> <h1 style="text-align:center"> <%=Category+"s"%> </h1> <%

	%> 
	<div class="item" style="margin:20px">
	<a href="itemDetails.jsp?idItem=<%=result.getString("item_id")%>"> Name: <%=result.getString("name")%> Breed: <%=result.getString("breed")%> Age: <%=result.getString("age")%></a>
	</div>
	<%
			
			
			while (result.next()) 
			{  %> 
				<div class="item" style="margin:20px">
				<a href="itemDetails.jsp?idItem=<%=result.getString("item_id")%>"> Name: <%=result.getString("name")%> Breed: <%=result.getString("breed")%> Age: <%=result.getString("age")%></a>
				</div>
				<%
			}
}


else{
	out.println("No items found with the characteristics you selected.");
	response.sendRedirect("noMatch.jsp"); 
}

}


%>

</body>
</html>