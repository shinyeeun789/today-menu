<%@page import="eatery.EateryDAO"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="eateryPlus.EateryPlusDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 오늘의 메뉴 </title>
</head>
<body>
<%
	PrintWriter script = response.getWriter();
	String plusID = request.getParameter("plusID");
	String foodType = request.getParameter("foodType");
	String eateryName = request.getParameter("eateryName");
	String area = request.getParameter("area");
	String location = request.getParameter("location");
	
	EateryPlusDAO eateryPlusDAO = new EateryPlusDAO();
	EateryDAO eateryDAO = new EateryDAO();
	if(eateryDAO.cheackEatery(eateryName, location)) {
		script.println("<script>");
		script.println("alert('이미 저장되어 있는 음식점입니다.')");
		script.println("location.href='eateryApprove.jsp'");
		script.println("</script>");
	} else {
		int result = eateryPlusDAO.tOrfAction(Integer.parseInt(plusID), true);
		int iResult = eateryDAO.insertNewEatery(foodType, eateryName, area, location);
		
		if(result >= 1 && iResult >= 1) {
			script.println("<script>");
			script.println("alert('정상적으로 반영되었습니다.')");
			script.println("location.href='eateryApprove.jsp'");
			script.println("</script>");
		} else {
			script.println("<script>");
			script.println("alert('오류가 발생했습니다.')");
			script.println("location.href='eateryApprove.jsp'");
			script.println("</script>");
		}
	}
%>
</body>
</html>