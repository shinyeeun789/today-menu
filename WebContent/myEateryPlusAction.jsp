<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="eateryPlus.EateryPlusDAO"%>
<%
	request.setCharacterEncoding("utf-8");
	String userID = request.getParameter("userID");
	EateryPlusDAO eateryPlusDAO = new EateryPlusDAO();
	JSONArray jsonArray = eateryPlusDAO.myEateryPlus(userID);
	
	response.getWriter().print(jsonArray);
%>