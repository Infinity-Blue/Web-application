<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Create A New Item To Sell:</title>
</head>
<body>

  <form action="storeItem.jsp" method="POST">
       Title <br/><input type="text" name="title"/> <br/>
       Initial Price <br/> <input type="text" name="initialprice"/> <br/>
       Minimum Price <br/><input type="text" name="minprice"/> <br/>
       Category <br/> <input type="text" name="category"/> <br/>
       Color <br/><input type="text" name="color"/> <br/>
       Name <br/><input type="text" name="name"/> <br/>
       Age <br/><input type="text" name="age"/> <br/>
       Breed <br/><input type="text" name="breed"/> <br/>
       <input type="submit" value="Submit"/>
       </form>


</body>
</html>