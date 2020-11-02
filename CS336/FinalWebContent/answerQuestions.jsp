<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>allQuestions</title>
</head>
<body>
<h1 style="text-align:center; font-size:40px">Answer a Question</h1>
<p style="text-align:right"><a style=" color:gray;" href='customerRepAllItems.jsp'>Home</a></p>
<a href='logout.jsp'>Log out</a> 
 <form action="success.jsp" method="POST">
<td align="right" style="vertical-align: top;">
            <button style="border: none; background: #404040; color: #ffffff !important; font-weight: 100; padding: 15px; border-radius: 6px" type = "submit" value = "Submit">Home</button>
        </td>
</form>
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
		{  
					
			String questionID = resultset.getString("idQuestions");%> 
			
				<div class="question">
			<div style="text-align:center; font-size:20px; font-weight: bold">
			<a <%=resultset.getString("idQuestions")%>><%=result.getString("Question")%></a>
			</div>
			
			 <form action="answerQuestionDetails.jsp?questionID=<%=questionID%>" method="POST">
			
				<div class="answer">
				<div style="text-align:center; font-size:20px; font-weight: bold">
     		  	<br/><textarea name = "answer" rows="4" cols="20"></textArea><br/>
       			       <button style="border: none; background: #404040; color: #ffffff !important; font-weight: 100; padding: 15px; border-radius: 6px" type="submit" value="Submit"/>Answer Question</button>
				</div>
				
       		</form>
			</div>
			<%
		}
		}
%>
<p style="text-align:center"><a style=" color:gray;" href='questions.jsp'>See Questions and Answers</a></p>
</body>
</html>