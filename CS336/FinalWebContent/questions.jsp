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
<a href='logout.jsp'>Log out</a> 

 <form action="success.jsp" method="POST">
<td align="right" style="vertical-align: top;">
            <button style="border: none; background: #404040; color: #ffffff !important; font-weight: 100; padding: 15px; border-radius: 6px" type = "submit" value = "Submit">Home</button>
        </td>
        
        
        </form>
<body>
  <!--<Search For A Question <br/> <input type="text" name="searchbar"/> <br/>-->
  
   <form action="searchQuestions.jsp" method="POST">
       <!--Login Name is email address-->
       <h1 style="text-align:center; font-size:40px">Questions</h1>
       <div style="text-align:center; font-size:20px">
      	Search <br/><textarea name = "searchbar" id="myTextArea" rows="6" cols="36"></textArea><br/>
        <button style="border: none; background: #404040; color: #ffffff !important; font-weight: 100; padding: 15px; border-radius: 6px" type="submit" value="Submit"/>Search</button>
       </form>
  
<%
	Application db = new Application();
	Connection con = db.getConnection();
	Statement st = con.createStatement();
	
	Application dbb = new Application();
	Connection conn = db.getConnection();
	Statement stt = con.createStatement();
	
	Application dbbb = new Application();
	Connection connn = db.getConnection();
	Statement sttt = con.createStatement();
	
	ResultSet result;
	ResultSet resultset;
	ResultSet resultsetset;
	
	String sql=""; 
	/* isdsql is itemiD in Item table that matches type*/
	String idsql="";
	String ans = "";
	
	sql="select Question from Questions"; 
	idsql="select * from Questions"; 
	ans = "select Answer from Questions";

	if(sql!="" && idsql!=""){
		result=st.executeQuery(sql);
		resultset=stt.executeQuery(idsql);
		resultsetset = sttt.executeQuery(ans);
		while (result.next() && resultset.next() && resultsetset.next()) 
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
<p style="text-align:center"><a style=" color:gray;" href='forum.jsp'>Ask a Question</a></p>
</body>
</html>