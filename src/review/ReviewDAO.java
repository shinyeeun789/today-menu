package review;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import eatery.EateryDAO;

public class ReviewDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public ReviewDAO() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String jdbcDriver = "jdbc:mysql://localhost:3306/foodRecommend?useSSL=false&serverTimezone=UTC";
			String dbUser = "root";
			String dbPass = "tkfkdgo1248!";
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public int getNext() {
		String SQL = "SELECT reviewID FROM review ORDER BY reviewID DESC";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1) + 1;
			}
			rs.close();
			pstmt.close();
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public int insertReviewInfo(String userID, int rating, String content, String eateryName) {
		EateryDAO eateryDAO = new EateryDAO();
		String SQL = "INSERT INTO review VALUES(?,?,?,date_format(now(),'%Y-%m-%d'),?,?)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, userID);
			pstmt.setInt(3, eateryDAO.getEateryID(eateryName));
			pstmt.setInt(4, rating);
			pstmt.setString(5, content);
			
			int result = pstmt.executeUpdate();
			pstmt.close();
			return result;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public JSONArray getReviewList(String eateryName, String order) {
		JSONArray jsonArray = new JSONArray();
		String SQL = "";
		try {
			if (order.equals("new")) {
				SQL = "SELECT reviewID, userID, reviewDate, rating, content "
						+ "FROM review JOIN eatery USING(eateryID) "
						+ "WHERE eateryName = ? ORDER BY reviewDate DESC, reviewID DESC";
			} else if (order.equals("asc")) {
				SQL = "SELECT reviewID, userID, reviewDate, rating, content "
						+ "FROM review JOIN eatery USING(eateryID) "
						+ "WHERE eateryName = ? ORDER BY rating";
			} else if (order.equals("desc")) {
				SQL = "SELECT reviewID, userID, reviewDate, rating, content "
						+ "FROM review JOIN eatery USING(eateryID) "
						+ "WHERE eateryName = ? ORDER BY rating DESC";
			}
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, eateryName);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				JSONObject obj = new JSONObject();
				obj.put("reviewID", rs.getString(1));
				obj.put("userID", rs.getString(2));
				obj.put("reviewDate", rs.getString(3));
				obj.put("rating", rs.getInt(4));
				obj.put("content", rs.getString(5));
				jsonArray.add(obj);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return jsonArray;
	}
}
