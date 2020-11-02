<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="cs336.pkg.*"%>
  <!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Answer Questions Detail</title>
</head>
<body>

 <form action="success.jsp" method="POST">
<td align="right" style="vertical-align: top;">
            <button style="border: none; background: #404040; color: #ffffff !important; font-weight: 100; padding: 15px; border-radius: 6px" type = "submit" value = "Submit">Home</button>
        </td>
</form>

<p style="text-align:right"><a style=" color:gray;" href='customerRepAllItems.jsp'>Home</a></p>
<%
String answer=request.getParameter("answer");
String questionID = request.getParameter("questionID");
try
{
	Application db = new Application();
	Connection con = db.getConnection();
	Statement st = con.createStatement();
	
	if(answer =="")
	{
	    out.println("Please fill out all fields"); %>
	    <br/><a href="forum.jsp">Forum</a>
<% 	}
 	else
	{ 
 		String addAnswer = "UPDATE Questions SET answer = '"+answer+"' WHERE idQuestions = '"+questionID+"';";
		PreparedStatement ps = con.prepareStatement(addAnswer);
		ps.execute(addAnswer);
       out.println("Question answered successfully");

	} 
	   
 }
catch (Exception e){
	out.println(e);
	}
%>
<br/><a href="questions.jsp">See All Questions & Answers</a>
</body>
</html>