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
String fullName=request.getParameter("Full name");
String email=request.getParameter("Login Name");
String password=request.getParameter("password");
int creditCardNumber=Integer.parseInt(request.getParameter("Creditcard Number"));
int dob=Integer.parseInt(request.getParameter("dateofbirth"));

try
{
	Application db = new Application();
	Connection con = db.getConnection();
	Statement st = con.createStatement();
	ResultSet rs=st.executeQuery("select * from UserAccount where email='"+email+"'");
	if (rs.next())
	{ 
		out.println("email already exists. Please use another email");
	}
	else
	{
		String insert = "INSERT INTO UserAccount(name,email,password,creditCardNumber,dob)" + "VALUES (?, ?, ?,?,?)";
		//Create a Prepared SQL statement allowing you to introduce the parameters of the query
		PreparedStatement ps = con.prepareStatement(insert);
		//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
		ps.setString(1, fullName);
		ps.setString(2, email);
		ps.setString(3, password);
		ps.setInt(4, creditCardNumber);
		ps.setInt(5, dob);
		//Run the query against the DB
		ps.executeUpdate();
		rs=st.executeQuery("select * from UserAccount where email='"+email+"'");
		if (rs.next())
		{
			out.println("query is successessfully added");
		}
		
         out.println("Account created successfully");
	 } 
 }
catch (Exception e){
	out.println(e);
	}

%>
</body>
</html>
