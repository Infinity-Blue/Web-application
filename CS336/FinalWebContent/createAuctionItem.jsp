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
  
  
         <h1 style="text-align:center; font-size:40px">Put Animal up 4 Auction</h1>
  
       <div style="text-align:center; font-size:20px">
  
       Title of Auction: <br/><input placeholder="Ex: Get Milo Today!" style="margin-bottom:20px" type="text" name="title"/> <br/>
       Auction End Time (YYYY-MM-DD HH:MM:SS) in <b>GMT</b>: <br/><input placeholder="Ex: 2019-04-24 14:35:10" style="margin-bottom:20px" type="text" name="enddate"/> <br/>
       Initial Price: <br/> <input placeholder="Ex: 200.00" style="margin-bottom:20px" type="text" name="initialprice"/> <br/>
       Minimum Price to Sell Item: <br/><input placeholder="Ex: 800.00" style="margin-bottom:20px" type="text" name="minprice"/> <br/>

       Category:
       
     	<input type="radio" name="category" value = "cat"> Cat
		<input type="radio" name="category" value = "dog"> Dog
		<input type="radio" name="category" value = "rabbit"> Rabbit
		
		<p style="margin-bottom:20px"> </p>
		
       Color: <br/><input placeholder="Ex: Brown" style="margin-bottom:20px" type="text" name="color"/> <br/>
       Name: <br/><input placeholder="Ex: Milo" style="margin-bottom:20px" type="text" name="name"/> <br/>
       Age: <br/><input placeholder="Ex: 12" style="margin-bottom:20px" type="text" name="age"/> <br/>
       Breed: <br/><input placeholder="Ex: Poodle" style="margin-bottom:30px" type="text" name="breed"/> <br/>

       <button style="margin:20px; border: none; background: #404040; color: #ffffff !important; font-weight: 100; padding: 15px; border-radius: 6px" type="submit" value="Submit"/>Put for Auction</button>
       
       </div>
       
       </form>


</body>
</html>