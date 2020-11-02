<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="cs336.pkg.*"%>
  <!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>deleteItem</title>
</head>
<body>
 <form action="success.jsp" method="POST">
<td align="right" style="vertical-align: top;">
            <button style="border: none; background: #404040; color: #ffffff !important; font-weight: 100; padding: 15px; border-radius: 6px" type = "submit" value = "Submit">Home</button>
        </td>
</form>
<%


String item_id = request.getParameter("idItem");

ItemUtils.deleteItem(item_id);


response.sendRedirect("customerRepAllItems.jsp");
%>

</body>
</html>