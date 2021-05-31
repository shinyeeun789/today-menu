<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" intial-scale="1">
<title> 오늘의 메뉴 </title>
<link rel="stylesheet" href="./css/foodRecommend.css">
</head>
<body>
	<jsp:include page="menu.jsp" flush="false"/>
    
    <!-- 로그인 폼 -->
    <div class="loginZone">
        <h2> 로그인 </h2>
    	<form method="post" action="loginAction.jsp" class="loginForm">
    		<input type="text" class="input" placeholder="아이디" name="userID"> <br>
    		<input type="password" class="input" placeholder="비밀번호" name="userPassword"> <br>
    		<input type="submit" class="inputLogin" value = "로그인">
    	</form>
    </div>
    
    <jsp:include page="footer.jsp" flush="false"/>
</body>
</html>