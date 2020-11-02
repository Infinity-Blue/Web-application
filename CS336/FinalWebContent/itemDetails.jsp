<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="cs336.pkg.*"%>
  <!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>

<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>searchItem</title>
<link href="./itemStyle.css" rel="stylesheet" type="text/css">
</head>

 <form action="success.jsp" method="POST">
<td align="right" style="vertical-align: top;">
            <button style="border: none; background: #404040; color: #ffffff !important; font-weight: 100; padding: 15px; border-radius: 6px" type = "submit" value = "Submit">Home</button>
        </td>
</form>

<body>


		
<%


Application db = new Application();
Connection con = db.getConnection();
Statement st = con.createStatement();

Application dbb = new Application();
Connection conn = db.getConnection();
Statement stt = con.createStatement();
ResultSet result;
String sql= "";

String id = request.getParameter("idItem");

/* check enddate of the auction  */

String itID = request.getParameter("idItem");


sql = "select * from Item natural join ItemProperties where item_id = '" + itID + "'";


result=st.executeQuery(sql);

while (result.next()) 
{  %> 
	<div style="text-align:center; margin-bottom:20px; font-size:40px">Title:
	<a style="text-decortion:none; text-align:center; font-size:40px" <%=result.getString("item_id")%>><b><%=result.getString("title")%></b></a>
	</div>
	<div style="text-align:center; margin-bottom:30px" class="item">
	<a style="font-size:20px; text-align:center; margin-bottom:30px;" href="historyOfbid.jsp?itID=<%=request.getParameter("idItem")%>"><b>Click here to view the history of the bids!</b></a>
	</div>
	<div class="item">Name:
	<a<%=result.getString("item_id")%>><%=result.getString("title")%></a>
	</div>
	<div class="item">Starting Price:
	<a<%=result.getString("item_id")%>><%=result.getString("Initial_price")%></a>
	</div>
	<div class="item">End Time (in GMT):
	<a<%=result.getString("item_id")%>><%=result.getString("end_date")%></a>
	</div>
	<div class="item">Color:
	<a<%=result.getString("item_id")%>><%=result.getString("color")%></a>
	</div>
	<div class="item">Breed:
	<a<%=result.getString("item_id")%>><%=result.getString("breed")%></a>
	</div>
	<div class="item">Name:
	<a<%=result.getString("item_id")%>><%=result.getString("name")%></a>
	</div>
	<div class="item">Age:
	<a<%=result.getString("item_id")%>><%=result.getString("age")%></a>
	</div>
	<%
}

/////////////////////////////////////////////////////////////////////////////
sql = "select * from Item natural join ItemProperties where item_id = '" + itID + "'";
ResultSet rs=st.executeQuery(sql);

java.sql.Timestamp currentTime = new java.sql.Timestamp(System.currentTimeMillis());
java.text.DateFormat dateFormat = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 


	if(rs.next())
	{   
		//Timefunction time=new Timefunction();
		//String test = rs.getString("end_date");
		//test = test.substring(0, 21);
		java.sql.Timestamp test = rs.getTimestamp("end_date");
		
		%> 
			<div class="item">Current Time (in GMT): <%=dateFormat.format(currentTime)%>
			</div>
		<%
		
		if(!(currentTime.before(test))){
			
			%> 
			<div style="margin-bottom:20px;" class="item"><b>The auction has been closed!</b></div>	
			<%		
			
			Application newdb = new Application();
			Connection newconn = newdb.getConnection();
			Statement newstt = newconn.createStatement();
			ResultSet newresult;

			String newsql= "";
			
			newsql = "select *, max(price) from Item natural join Bid natural join UserAccount where item_id = "+id;
			newresult=newstt.executeQuery(newsql);
		
			if(newresult.next()){
			
			%> 
			<div style = "margin-top:30px;text-align:center; font-size:40px">The winner of the auction was: <b><%=newresult.getString("name")%></b></div>	
			<div style = "margin-top:30px;text-align:center; font-size:40px">With a bid of $<b><%=newresult.getString("max(price)")%></b>!</div>	
			
			<%		
			}
			
		}
			
			
		
		
		else{
			

			%> 
				<div class="item"><b>The auction is still open!</b>
				</div>	
				
				<div style="font-size:20px; text-align:center"> 
				<form style="margin:40px" action="bidSuccessful.jsp?idItem=<%=itID%>" method="POST">
     			 <b>Single Bid</b> - 
     			 <p>Please enter a single bid and then press submit: </p><input type="text" name="bidValue" placeholder="Ex: 500.00" required/> <br/>
       		<button style="margin:20px;border: none; background: #404040; color: #ffffff !important; font-weight: 100; padding: 15px; border-radius: 6px" type="submit" value="Submit"/>Place Bid</button>

      			 </form>	
      			 </div>
      			 
      			 <p style="text-align:center">______________________________________________</p>
			<%	
			
			
			%> 
			<div style="font-size:20px; text-align:center">
			
			<form style="margin:40px" action="AutoBid.jsp?idItem=<%=itID%>" method="POST">
 			  <b>Automatic Bidding</b> - 
 			  <p>Please enter your starting bid price:</p> <input type="text" name="bidValue" placeholder="Ex: 500.00" required/> 
 			  <p>Hidden maximum value:</p> <input type="text" name="maxValue" placeholder="Ex: 500.00" required/> 
 			  <p>Increment value:</p> <input type="text" name="incrementValue" placeholder="Ex: 500.00" required/> <br/>
       		<button style="margin:20px; border: none; background: #404040; color: #ffffff !important; font-weight: 100; padding: 15px; border-radius: 6px" type="submit" value="Submit"/>Place Auto-Bid</button>
  			 </form>	
  			 </div>	
  			 
			<%	
		
						
		}
	}


%>

</body>
</html>