<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name = "viewport" content="width=device-width, initial-scale=1.0">
<title> 오늘의 메뉴 </title>
<link rel="stylesheet" href="./css/foodRecommend.css">

<script src="./js/jquery-1.11.0.min.js" type="text/javascript"></script>
<script src="./js/i18n/grid.locale-en.js" type="text/javascript"></script>
<script src="./js/jquery.jqGrid.min.js" type="text/javascript"></script>
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
	<script type="text/javascript">
		var userID = "<%=userID%>";
		function write(result) {
			$.jgrid.gridUnload('#plusList');	// 그리드 지우고 다시 그리기
			
			$("#plusList").jqGrid({
				datatype: "local",
				data: result,
				mtype: 'get',
				colNames: ['음식점명','음식점 주소','승인 여부'],
				colModel: [
					{ name: 'eateryName', index: 'eateryName', width: 100, align: 'center'},
					{ name: 'location', index: 'location', width: 100, align: 'center'},
					{ name: 'approve', index: 'approve', width: 100, align: 'center'}
				],
				loadtext: '로딩 중입니다:)',
				emptyrecords: '리뷰 작성 이력이 없습니다.',
				autowidth: true,
				height: 'auto',
				pager: jQuery('#page'),
				rowNum: 10
			});
		}
		
		$(document).ready(function() {
			$.ajax({
				url: "./myEateryPlusAction.jsp",
				type: "POST",
				data: {'userID':userID},
				dataType: "json",
				success : function(result) {
					write(result);
				},
				error : function(request, status, error) {
					alert("데이터를 불러오지 못했습니다.");
				}
			});
		})
	</script>
	
	<jsp:include page="menu.jsp" flush="false"/>
    
    <div class="myPageForm">
    	<h2> <%= userID%> </h2>
    	<br> <hr>
    	<h3> 내가 추가 신청한 맛집 </h3>
    	<table id="plusList"></table>
    	<div id="page"></div>
    	
    	<br>
    	<h3> 내 리뷰 </h3>
    	<table id="reviewList"></table>
    </div>
    <div class="logoutDiv"> <a href="logoutAction.jsp"> 로그아웃 </a> </div>
    
    <jsp:include page="footer.jsp" flush="false"/>
</body>
</html>