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
String from=request.getParameter("From");
String to=request.getParameter("To");
String subject=request.getParameter("Subject");
String content=request.getParameter("Content");


try
{
	Application db = new Application();
	Connection con = db.getConnection();
	Statement st = con.createStatement();
	
	if(from ==""||to ==""||subject ==""||content =="")
	{
	    out.println("Please fill out all fields"); %>

<% 	}
 	else
	{ 
	//int row=st.executeUpdate("INSERT INTO UserAccount(name,email,password,creditCardNumber,dob)VALUES('"+fullName+"','"+email+"','"+password+"','"+creditCardNumber+"','"+dob+"')");
	//int row=st.executeUpdate("INSERT INTO UserAccount "+"VALUES('fullName','email','password',creditCardNumber,dob)");
       //String insert = "INSERT INTO Email(From,To,Subject,Content)" + "VALUES (?,?,?,?)";
       
       String insert = "insert into Email(fromUser, goesTo, emailSubject, Content)" + "Values (?,?,?,?)";
  
		//Create a Prepared SQL statement allowing you to introduce the parameters of the query
		PreparedStatement ps = con.prepareStatement(insert);

		//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
		ps.setString(1, from);
		ps.setString(2, to);
		ps.setString(3, subject);
		ps.setString(4, content);
		//Run the query against the DB
		ps.executeUpdate();
		/* rs=st.executeQuery("select * from UserAccount where email='"+email+"'");
		if (rs.next())
		{
			out.println("query is successessfully added");
		} */
		//con.close();
       out.println("Email sent successfully. Please log back in to verify your credentials.");
       
       %>
       <div>
        <p style="text-align:center; margin:30px"><a style=" color:gray; font-size:40px;text-decoration: none" href='index.html'>Click Here To Log back in</a></p>
  
       </div>
       <%
       
	} 
	   
 }
catch (Exception e){
	out.println(e);
	}
%>
</body>
</html>