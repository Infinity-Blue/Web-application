package cs336.pkg;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class ItemUtils {
	

	public static void insertItem(String title, String initialPrice, String minPrice, String category, String color, String age, String name, String breed) throws SQLException {
		Application db = new Application();
		Connection con = db.getConnection();

		 

		String insert = "INSERT INTO Item (title,initial_Price, min_price, Category)"
				+ "VALUES (?, ?, ?, ?)";
		//Create a Prepared SQL statement allowing you to introduce the parameters of the query
		PreparedStatement ps = con.prepareStatement(insert);

		//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
		ps.setString(1, title);
		ps.setDouble(2, Double.parseDouble(initialPrice));
		ps.setDouble(3, Double.parseDouble(minPrice));
		ps.setString(4, category);
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
	
		
		
		
		//Application db = new Application();
		//Connection con = db.getConnection();
		
		//String insert = " insert into ItemProperties ​(item_id, color, age, breed, name) VALUES ( ?, ?, ?, ?, ? )";
		//Create a Prepared SQL statement allowing you to introduce the parameters of the query
		
		query = " insert into ItemProperties (item_id, color, age, breed, name) values (?,?,?,?,?)";
		
		PreparedStatement ps1 = con.prepareStatement(query);

		//Add parameters of the query. Start 1with 1, the 0-parameter is the INSERT statement itself
		
		/*
		ps1.setLong(1, 4);
		ps1.setString(2, "blue");
		ps1.setLong(3, 5);
		ps1.setString(4, "poodle");
		ps1.setString(5, "tucker");
		
		*/
		
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
	public static void main(String [] args) throws SQLException {
		insertItem("guby","999.99", "500.00", "Dog", "White", "5", "tucker", "poodle");
	}
*/
	
}
