<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="org.json.simple.JSONArray" %>
<%@ page import="review.ReviewDAO" %>
<%
	PrintWriter script = response.getWriter();
	String contents = request.getParameter("content");
	int rating = Integer.parseInt(request.getParameter("totalRating"));
	String eateryName = request.getParameter("eateryName");
	int type = Integer.parseInt(request.getParameter("type"));
	String order = request.getParameter("order");
	String userID = null;
	if(session.getAttribute("userID") != null){
		userID = (String)session.getAttribute("userID");
	}
	ReviewDAO reviewDAO = new ReviewDAO();
	JSONArray jsonArray = new JSONArray();
	
	if (type == 1) {
		reviewDAO.insertReviewInfo(userID, rating, contents, eateryName);
	}
	jsonArray = reviewDAO.getReviewList(eateryName, order);
	
	response.getWriter().print(jsonArray);
%>