package cs336.pkg;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Application {
	public Application(){
		
	}

public Connection getConnection()
{
	//Create a connection string
	Connection connection = null;
	
	try {
		//Load JDBC driver - the interface standardizing the connection procedure. Look at WEB-INF\lib for a mysql connector jar file, otherwise it fails.
		Class.forName("com.mysql.jdbc.Driver").newInstance();
	} catch (InstantiationException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} catch (IllegalAccessException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} catch (ClassNotFoundException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	try {
		//Create a connection to your DB
		connection = DriverManager.getConnection("jdbc:mysql://buyme.cdvbrtprel1b.us-east-2.rds.amazonaws.com:3306/BuyMe", "group9", "group9rox");
		//connection = DriverManager.getConnection("jdbc:mysql://cs336db.cdvbrtprel1b.us-east-2.rds.amazonaws.com:3306/CS336Schema","CS336","CssC336$$");
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return connection;
}

public void closeConnection(Connection connection){
	try {
		connection.close();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
}

public static void main(String[] args) {
	Application db = new Application();
	Connection connection = db.getConnection();
	
	System.out.println(connection);		
	db.closeConnection(connection);
}

}