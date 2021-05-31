package eateryPlus;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import org.json.simple.JSONObject;
import org.json.simple.JSONArray;

public class EateryPlusDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public EateryPlusDAO() {
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
		String SQL = "SELECT plusID FROM eateryPlus ORDER BY plusID DESC";
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
	
	public int insertEateryInfo(String userID, String eateryName, String area, String location) {
		String SQL = "INSERT INTO eateryPlus(plusID, userID, eateryName, area, location) VALUES(?,?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, userID);
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
	
	public ArrayList<EateryPlus> getEateryPlus() {
		String SQL = "SELECT plusID, userID, eateryName, area, location FROM eateryPlus WHERE approve IS NULL";
		ArrayList<EateryPlus> list = new ArrayList<EateryPlus>(); 
		try {
			pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				EateryPlus eateryPlus = new EateryPlus();
				eateryPlus.setPlusID(rs.getInt(1));
				eateryPlus.setUserID(rs.getString(2));
				eateryPlus.setEateryName(rs.getString(3));
				eateryPlus.setArea(rs.getString(4));
				eateryPlus.setLocation(rs.getString(5));
				list.add(eateryPlus);
			}
			rs.close();
			pstmt.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public int tOrfAction(int plusID, boolean bool) {
		String SQL = "UPDATE eateryPlus SET approve = ? WHERE plusID = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setBoolean(1, bool);
			pstmt.setInt(2, plusID);
			
			int result = pstmt.executeUpdate(); 
			pstmt.close();
			return result;
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public JSONArray myEateryPlus(String userID) {
		JSONArray jsonArray = new JSONArray();
		System.out.println("들어왔어");
		try {
			String SQL = "SELECT eateryName, location, approve FROM eateryPlus "
					+ "WHERE userID = ?";
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				JSONObject obj = new JSONObject();
				obj.put("eateryName", rs.getString(1));
				obj.put("location", rs.getString(2));
				obj.put("approve", rs.getBoolean(3));
				jsonArray.add(obj);
			}
			rs.close();
			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return jsonArray;
	}
}
