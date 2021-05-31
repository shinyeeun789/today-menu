<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 오늘의 메뉴 </title>
<link rel="stylesheet" href="./css/foodRecommend.css">
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
</head>
<body>
	<% String foodType = request.getParameter("foodType"); %>
	
	<script type="text/javascript">
		var foodType = "<%=foodType%>";
		
		window.onpageshow = function(event) {
			var area = $("select[name=area]").val();
			funcAjax(area);
	       	$(".selectBox").on('change', function() {
				var innerArea = $("select[name=area]").val();
				funcAjax(innerArea);
			});
		};
		
		function proc(result) {
			$("table").remove();
			var str = "";
			for(i in result) {
				str += "<a href='./reviewForm.jsp?eateryName=" + result[i].eateryName + "'><table><tr>";
				str += "<td width='300px'>" + result[i].eateryName + "</td>";
				str += "<td width='100px'><img src='./picture/filledStar.png' width='14px'> " + result[i].rating.toFixed(1) + "</td>";
				str += "<td>" + result[i].location + "</td>";
				str += "</tr></table></a>";
			}
			$("#eateryDiv").append(str);
		}
		
		function funcAjax(area) {
			$.ajax({
				url: "./recommendFoodAction.jsp",
				type: "POST",
				data: {'foodType':foodType, 'area':area},
				dataType: "json",
				success : function(result) {
					proc(result);
				},
				error : function(request, status, error) {
					alert("데이터를 불러올 수 없습니다.");
				}
			});
		}
	</script>
	
	<jsp:include page="menu.jsp" flush="false"/>
    
    <div class="recommendForm">
    	<select class="selectBox" name="area">
    		<option> 서울 </option>
    		<option> 경기 </option>
    		<option> 인천 </option>
    		<option> 부산 </option>
    		<option> 제주 </option>
    	</select>
    	<span> <%= foodType %> </span>
    	<div class="eateryPlusZone">
    		<button class="btnEateryPlus" onclick="location.href='eateryPlusForm.jsp'"> 음식점 추가 신청 </button>
    	</div>
    	<hr>
    	<div class="eateryDiv" id="eateryDiv"> </div>
    	
    </div>
    <jsp:include page="footer.jsp" flush="false"/>
</body>
</html>