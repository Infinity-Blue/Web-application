package cs336.pkg;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;
import java.util.Date;



public class ItemUtils {

	
	
	public static void deleteItem(String item_id) throws SQLException {

		Application db = new Application();
		Connection con = db.getConnection();
		Statement st = con.createStatement();
		ResultSet result; 

		String sql=""; 
		/* isdsql is itemiD in Item table that matches type*/


		sql = "delete from Item where item_id = ?";

		PreparedStatement ps = con.prepareStatement(sql);


		ps.setInt(1, Integer.parseInt(item_id));
		ps.execute();

	}
	
	

	public static void insertItem(String title, String enddate, String initialPrice, String minPrice, String category, String color, String age, String name, String breed) throws SQLException, ParseException {
		Application db = new Application();
		Connection con = db.getConnection();

		 

		String insert = "INSERT INTO Item (title, end_date, initial_Price, min_price, Category)"
				+ "VALUES (?, ?, ?, ?, ?)";
		//Create a Prepared SQL statement allowing you to introduce the parameters of the query
	
		PreparedStatement ps = con.prepareStatement(insert);

		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 

		Date parsedDate = dateFormat.parse(enddate);
		
	    Timestamp timestamp = new java.sql.Timestamp(parsedDate.getTime());
		
		
		//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
		ps.setString(1, title);
		ps.setTimestamp(2, timestamp);
		ps.setDouble(3, Double.parseDouble(initialPrice));
		ps.setDouble(4, Double.parseDouble(minPrice));
		ps.setString(5, category);
		//Run the query against the DB
		ps.execute();
		
		String query = "SELECT LAST_INSERT_ID() AS item_id";
		
		Statement st = con.createStatement();
		ResultSet rs=st.executeQuery(query);
		
		int itemID = 0;	
		while (rs.next())
		{ 
			itemID = rs.getInt("item_id");
		}
		
		System.out.println("ITEID: " + itemID);
		System.out.println("breed = " + breed);
	
		
		
		query = " insert into ItemProperties (item_id, color, age, breed, name) values (?,?,?,?,?)";
		
		PreparedStatement ps1 = con.prepareStatement(query);
		
		ps1.setInt(1, itemID);
		ps1.setString(2, color);
		ps1.setInt(3, Integer.parseInt(age));
		ps1.setString(4, breed);
		ps1.setString(5, name);

		System.out.println("Inserting: " + query);
		//Run the query against the DB
		ps1.execute();
		
		con.close();

		
		
	}
	
	/*
	public static void main(String [] args) throws SQLException, ParseException {
		insertItem("testing3","2019-04-22 20:14:38","999.99", "500.00", "Dog", "White", "5", "2tucker12time", "poodle");
	}
*/
	
}
