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
	String plusID = request.getParameter("plusID");
	EateryPlusDAO eateryPlusDAO = new EateryPlusDAO();
	int result = eateryPlusDAO.tOrfAction(Integer.parseInt(plusID), false);
	PrintWriter script = response.getWriter();
	
	if(result >= 1) {
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
%>
</body>
</html>