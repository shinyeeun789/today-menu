<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="eatery.EateryDAO"%>
<%
	request.setCharacterEncoding("utf-8");
	String foodType = request.getParameter("foodType");
	String area = request.getParameter("area");
	EateryDAO eateryDAO = new EateryDAO();
	JSONArray jsonArray = eateryDAO.getEateryList(foodType, area);
	
	response.getWriter().print(jsonArray);
%>