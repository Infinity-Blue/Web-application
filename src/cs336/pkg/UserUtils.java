package cs336.pkg;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.sql.Statement;

public class UserUtils {
	
	
	
	public static boolean doesUserExist(String emailId) throws SQLException {
		Application db = new Application();
		Connection con = db.getConnection();
		PreparedStatement ps = con.prepareStatement("select Email from UserAccount where Email = ?");
		ps.setString(1, emailId);
		ResultSet rs = ps.executeQuery();
		if (rs.next()) {
				return true;
		}
		return false;
	}
	
	
	public static List<String> getEmailIDs() throws SQLException {
		Application db = new Application();
		Connection con = db.getConnection();
		Statement st = con.createStatement();
		ResultSet rs=st.executeQuery("select Email from UserAccount");
		
		ArrayList<String> emailList = new ArrayList<String>();
		
		while (rs.next())
		{ 
			String email = rs.getString("Email");
			emailList.add(email);
		}
		return emailList;
	}
	
	
	public static void main(String [] args) throws SQLException {
		System.out.println(getEmailIDs());
		System.out.println(doesUserExist("rg743@gmail.com"));
	}
	
}

