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
	String userID = null;	
	if(session.getAttribute("userID") != null){
		userID = (String)session.getAttribute("userID");
	}
	PrintWriter script = response.getWriter();
	String eateryName = request.getParameter("eateryName");
	String area = request.getParameter("area");
	String location = request.getParameter("location");
	int result = -2;
	
	if(eateryName.equals("") || area.equals("") || location.equals("")) {
		script.println("<script>");
		script.println("alert('입력되지 않은 사항이 있습니다.')");
		script.println("location.href = 'eateryPlusForm.jsp'");
		script.println("</script>");
	} else {
		EateryPlusDAO eateryPlusDAO = new EateryPlusDAO();
		result = eateryPlusDAO.insertEateryInfo(userID, eateryName, area, location);
	}
	
	if(result >= 1) {
		script.println("<script>");
		script.println("alert('신청이 완료되었습니다.')");
		script.println("location.href = 'main.jsp'");
		script.println("</script>");
	} else {
		script.println("<script>");
		script.println("alert('오류가 발생했습니다.')");
		script.println("location.href = 'eateryPlusForm.jsp'");
		script.println("</script>");
	}
%>
</body>
</html>