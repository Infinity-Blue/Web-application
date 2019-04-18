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
<%
String question=request.getParameter("question");
String name=request.getParameter("name");
String email=request.getParameter("email");

try
{
	Application db = new Application();
	Connection con = db.getConnection();
	Statement st = con.createStatement();
	
	if(question ==""||email==""||name =="")
	{
	    out.println("Please fill out all fields"); %>
	    <br/><a href="forum.jsp">Forum</a>
<% 	}
 	else
	{ 
	//int row=st.executeUpdate("INSERT INTO UserAccount(name,email,password,creditCardNumber,dob)VALUES('"+fullName+"','"+email+"','"+password+"','"+creditCardNumber+"','"+dob+"')");
	//int row=st.executeUpdate("INSERT INTO UserAccount "+"VALUES('fullName','email','password',creditCardNumber,dob)");
    String insert = "INSERT INTO Questions(Question,Name,Email)" + "VALUES (?,?,?)";
		//Create a Prepared SQL statement allowing you to introduce the parameters of the query
		PreparedStatement ps = con.prepareStatement(insert);

		//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
		ps.setString(1, question);
		ps.setString(2, name);
		ps.setString(3, email);
		//Run the query against the DB
		ps.executeUpdate();
		/* rs=st.executeQuery("select * from UserAccount where email='"+email+"'");
		if (rs.next())
		{
			out.println("query is successessfully added");
		} */
		//con.close();
       out.println("Question posted successfully");
       
	} 
	   
 }
catch (Exception e){
	out.println(e);
	}
%>
<br/><a href="questions.jsp">See All Questions</a>
</body>
</html>