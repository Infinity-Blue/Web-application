package cs336.pkg;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
public class BidUtils {

	public static void adjustAutoBids(Double currentBid, int item_id, boolean auto) throws SQLException {
		Application db = new Application();
		Connection con = db.getConnection();
		Statement st = con.createStatement();	
		ResultSet result; 

		String sql = "";
		String bidType = "auto";
		sql = "select * from Bid where item_id = ? and bidType = ? and maximumValue > ? order by maximumValue desc";

		PreparedStatement ps = con.prepareStatement(sql);

		ps.setInt(1, item_id);
		ps.setString(2, bidType);
		ps.setDouble(3, currentBid);

		result = ps.executeQuery();

		int bidId =-1;
		int i = 0;
		Double maxBid = 0.0;
		Double incVal = 0.0;
		Double increaseUpTo = currentBid;

		Double myMaxPrice =0.0;

		while (result.next()) {
			if (i == 0) {
				bidId = result.getInt("bidID");
				maxBid = result.getDouble("maximumValue");
				incVal = result.getDouble("incrementVal");
				myMaxPrice = result.getDouble("price");
			}
			else if (i == 1) {
				increaseUpTo = result.getDouble("maximumValue");
				++i;
				break;
			}
			i++;
		}

		if (i==1 && auto)
			return;
		Double newPrice = 0.0;
		if (bidId != -1) {

			newPrice = increaseUpTo + incVal;
			sql = "update Bid set price = ? where bidID = ?";

		//	System.out.println("<p> i=" + i + " increaseUpTo=" + increaseUpTo + "</p>");
			
			ps = con.prepareStatement(sql);

			ps.setDouble(1, newPrice);
			ps.setInt(2, bidId);

			ps.execute();




		}

	}
/*
	public static void main(String [] args) throws SQLException {
		adjustAutoBids(2500.00, 2013170020, true);
	}
*/
}
