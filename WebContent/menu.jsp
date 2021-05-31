<%@page import="user.UserDAO"%>
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
		UserDAO userDAO = new UserDAO();
	%>
	<nav class="nav-container">
        <a class="nav-logo" href="main.jsp"> 오늘의 메뉴 </a>
        <a class="nav-item" href="main.jsp"> 메뉴 정하기 </a>
        <a class="nav-item" href="eateryPlusForm.jsp"> 음식점 추가 신청 </a>
        <% if(!userDAO.isAdmin(userID)) { %>
        	<a class="nav-item" href="myPage.jsp"> 마이페이지 </a>
        <% } else { %>
        	<a class="nav-item" href="eateryApprove.jsp"> 추가 신청 승인 </a>
        <% } %>
        <% if(userID == null) { %>
        	<a class="nav-login" href="loginForm.jsp"><img src="./picture/user.png" width="25px" height="25px"> 로그인 </a>
        <% } else { %>
        	<a class="nav-login" href="logoutAction.jsp"><img src="./picture/user.png" width="25px" height="25px"> 로그아웃 </a>
        <% } %>
    </nav>
</body>
</html>