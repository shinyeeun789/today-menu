package eateryPlus;

public class EateryPlus {
	private int plusID;
	private String userID;
	private String eateryName;
	private String area;
	private String location;
	private boolean approve;
	
	public int getPlusID() {
		return plusID;
	}
	public void setPlusID(int plusID) {
		this.plusID = plusID;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getEateryName() {
		return eateryName;
	}
	public void setEateryName(String eateryName) {
		this.eateryName = eateryName;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public boolean isApprove() {
		return approve;
	}
	public void setApprove(boolean approve) {
		this.approve = approve;
	}
}
