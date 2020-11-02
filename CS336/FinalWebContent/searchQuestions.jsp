<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="cs336.pkg.*"%>
  <!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>storeAccount</title>
</head>
<body>
 <h1 style="text-align:center; font-size:40px">Search Results</h1>
 
 <a href='logout.jsp'>Log out</a> 
<%
String search=request.getParameter("searchbar");

	Application db = new Application();
	Connection con = db.getConnection();
	Statement st = con.createStatement();
	ResultSet result;
	
	Application dbb = new Application();
	Connection conn = db.getConnection();
	Statement stt = con.createStatement();
	ResultSet resultset;
	
	Application dbbb = new Application();
	Connection connn = db.getConnection();
	Statement sttt = con.createStatement();
	ResultSet resultsetset;
	
//	String sql = "select * FROM Questions WHERE Question LIKE '%happy%'";

 String idsql="select * from Questions"; 
 String sql = "select * FROM Questions WHERE Question LIKE '%" + search + "%'";
 String ans = "select Answer from Questions";
	
	if(sql!="" & idsql!=""){
		result=st.executeQuery(sql);
		resultset=stt.executeQuery(idsql);
		resultsetset = sttt.executeQuery(ans);
		while (result.next() && resultset.next() & resultsetset.next()) 
		{  %> 
		<div class="question">
		<div style="text-align:center; font-size:20px; font-weight: bold">
		<a <%=resultset.getString("idQuestions")%>><%=result.getString("Question")%></a>
		</div>
		<%
		
		%> 
		<div class="answer">
		<div style="text-align:center; font-size:20px">
		<a <%=resultset.getString("idQuestions")%>><%=resultsetset.getString("Answer")%></a>
		</div>
		<%
	}
		
		}

%>
<p style="text-align:center"><a style=" color:gray;" href='questions.jsp'>Back To Questions</a></p>
</body>
</html>