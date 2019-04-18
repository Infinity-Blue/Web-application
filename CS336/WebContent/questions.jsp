<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="cs336.pkg.*"%>
  <!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>allQuestions</title>
</head>
<body>
<br/> All Questions <br/>

  Search For A Question <br/> <input type="text" name="searchbar"/> <br/>

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
	
	sql="select Question from Questions"; 
	idsql="select * from Questions"; 

	if(sql!="" && idsql!=""){
		result=st.executeQuery(sql);
		resultset=stt.executeQuery(idsql);
		while (result.next() && resultset.next()) 
		{  %> 
			<div class="question">
			<a <%=resultset.getString("idQuestions")%>><%=result.getString("Question")%></a>
			</div>
			<%
		}
		}
%>
<br/><a href="forum.jsp">Ask a Question</a>
</body>
</html>