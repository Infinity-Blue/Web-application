<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Forum</title>
</head>

 <form action="success.jsp" method="POST">
<td align="right" style="vertical-align: top;">
            <button style="border: none; background: #404040; color: #ffffff !important; font-weight: 100; padding: 15px; border-radius: 6px" type = "submit" value = "Submit">Home</button>
        </td>
</form>
<body>
  	   <h1 style="text-align:center; font-size:40px">Ask A Question</h1>
  	   
       <form action="forumDetails.jsp" method="POST">
        <div style="text-align:center; font-size:20px">
        
       What is your question? <br/><textarea name = "question" id="myTextArea" rows="6" cols="36"></textArea><br/>
       Name <br/> <input style="margin-bottom:20px" type="text" name="name"/> <br/>
       Email <br/> <input style="margin-bottom:20px" type="text" name="email"/> <br/>
       <button style="border: none; background: #404040; color: #ffffff !important; font-weight: 100; padding: 15px; border-radius: 6px" type="submit" value="Submit"/>Send Question</button>
       </form>
       <p style="text-align:center"><a style=" color:gray;" href='questions.jsp'>See Already Asked Questions</a></p>
     
</body>
</html>

