package eatery;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

public class EateryDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public EateryDAO() {
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
		String SQL = "SELECT eateryID FROM eatery ORDER BY eateryID DESC";
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
	
	// 새로운 음식점 정보 추가
	public int insertNewEatery(String foodType, String eateryName, String area, String location) {
		String SQL = "INSERT INTO eatery VALUES(?,?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, foodType);
			pstmt.setString(3, eateryName);
			pstmt.setString(4, area);
			pstmt.setString(5, location);
			
			int result = pstmt.executeUpdate();
			pstmt.close();
			return result;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}

	public boolean cheackEatery(String eateryName, String location) {
		String SQL = "SELECT eateryName FROM eatery WHERE eateryName = ? and location = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, eateryName);
			pstmt.setString(2, location);
			rs = pstmt.executeQuery();
		
			if(rs.next())
				return true;
			
			rs.close();
			pstmt.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public JSONArray getEateryList(String foodType, String area) {
		JSONArray jsonArray = new JSONArray();
		try {
			String SQL = "SELECT eateryName, location, AVG(rating)" + 
					"FROM eatery LEFT OUTER JOIN review USING(eateryID)" +
					"WHERE foodType = ? AND area = ? " +
					"group by eateryName " +
					"order by 3 DESC";
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, foodType);
			pstmt.setString(2, area);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				JSONObject obj = new JSONObject();
				obj.put("eateryName", rs.getString(1));
				obj.put("location", rs.getString(2));
				obj.put("rating", rs.getFloat(3));
				jsonArray.add(obj);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return jsonArray;
	}
	
	public int getEateryID(String eateryName) {
		int eateryID = -1;
		try {
			String SQL = "SELECT eateryID FROM eatery WHERE eateryName = ?";
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, eateryName);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				eateryID = rs.getInt(1);
			}
			rs.close();
			pstmt.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return eateryID;
	}
}
