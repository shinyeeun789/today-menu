<%@page import="java.util.ArrayList"%>
<%@page import="eateryPlus.EateryPlusDAO"%>
<%@page import="eateryPlus.EateryPlus"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 오늘의 메뉴 </title>
<link rel="stylesheet" href="./css/foodRecommend.css">
</head>
<body>
<%
	EateryPlusDAO eateryPlusDAO = new EateryPlusDAO();
	ArrayList<EateryPlus> eateryPlusList = eateryPlusDAO.getEateryPlus();
	String trueURL = "", falseURL = "";
%>
	<jsp:include page="menu.jsp" flush="false"/>
	
	<div class="eateryApproveDiv">
		<table class="eateryPlusList">
			<tr> <th> 사용자ID </th> <th> 음식점명 </th> <th> 지역 </th> <th> 주소 </th> <th> 음식 타입 </th> </tr>
			<% for(EateryPlus item : eateryPlusList) { 
				trueURL = "trueAction.jsp?plusID=" + item.getPlusID() + "&type=";
				falseURL = "falseAction.jsp?plusID=" + item.getPlusID() + "&type=";
			%>
				<tr>
					<td> <%=item.getUserID()%> </td>
					<td> <%=item.getEateryName()%> </td>
					<td> <%=item.getArea()%> </td>
					<td style="width: 500px"> <%=item.getLocation()%> </td>
					<td> <form action="falseAction.jsp"> 
						<input type="hidden" name="plusID" value="<%=item.getPlusID()%>">
						<input type="hidden" name="eateryName" value="<%=item.getEateryName()%>">
						<input type="hidden" name="area" value="<%=item.getArea()%>">
						<input type="hidden" name="location" value="<%=item.getLocation()%>">
						<select class="inputSelect" name="foodType">
							<option>한식</option>
							<option>중식</option>
							<option>일식</option>
							<option>양식</option>
							<option>분식</option>
							<option>야식</option>
						</select>
						<input class="btnSubmit" type="submit" value="승인" formaction="trueAction.jsp">
						<input class="btnSubmit" type="submit" value="비승인">
					</form> </td>
				</tr>			
			<% } %>
		</table>
	</div>
	
	<jsp:include page="footer.jsp" flush="false"/>
</body>
</html>