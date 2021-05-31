<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 오늘의 메뉴 </title>
<link rel="stylesheet" href="./css/foodRecommend.css">
</head>
<body>
<%
	String userID = null;	
	if(session.getAttribute("userID") != null){
		userID = (String)session.getAttribute("userID");
	} else {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인 후 사용할 수 있습니다.')");
		script.println("location.href = 'loginForm.jsp'");
		script.println("</script>");
	}
%>
	<jsp:include page="menu.jsp" flush="false"/>
		
	<form class="eateryPlusForm" action="eateryPlusAction.jsp">
		<table class="eateryPlusTable">
			<tr><td>
			<select class="selectBox" name="area">
				<option> 서울 </option>
	    		<option> 경기 </option>
	    		<option> 인천 </option>
	    		<option> 부산 </option>
	    		<option> 제주 </option>
			</select> </td>
			<td>
				<input type="text" placeholder="추가하고 싶은 음식점명을 적어주세요 " name="eateryName" class="inputText">
			</td></tr>
			<tr><td colspan="2"> <input type="text" placeholder="음식점 주소를 적어주세요" name="location" class="inputTextLocation"> </td></tr>
			<tr><td colspan="2"> <input type="submit" class="btnPlus"> </td></tr>
		</table>
		
	</form>
	
	<jsp:include page="footer.jsp" flush="false"/>
</body>
</html>