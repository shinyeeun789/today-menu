<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="user.User"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name = "viewport" content="width=device-width, initial-scale=1.0">
<title> 오늘의 메뉴 </title>
<link rel="stylesheet" href="./css/foodRecommend.css">
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$(".btnSelect").hide();
		var ranNum;
		var startRandom;
		var foodArray = new Array();
		foodArray[1] = "한식";
		foodArray[2] = "중식";
		foodArray[3] = "양식";
		foodArray[4] = "일식";
		foodArray[5] = "분식";
		foodArray[6] = "야식";
		
		function setRandom() {
			startRandom = setInterval(function() {
				var beforeNum = ranNum;
				while(true) {
					if(beforeNum != ranNum) {
						break;
					}
					ranNum = Math.floor(Math.random()*6+1);
				}
				$(".food").text(foodArray[ranNum]);
			}, 60);
		}
		
		$(".btnStart").click (function() {
			$(".btnStart").hide(1000);
			$(".btnSelect").hide(1000);
			$(".food").css("transition", "0.3s");
			$(".food").css("font-size", "24pt");
			setRandom();

			setTimeout(function() {
				$(".btnStart").text("다시 돌리기");
				$(".btnStart").show(700);
				$(".btnSelect").show(700);
				clearInterval(startRandom);
				$(".food").css("transition", "0.3s");
				$(".food").css("font-size", "30pt");
			}, 2500);
		});
		
		$(".btnSelect").click (function() {
			location.href="recommendFood.jsp?foodType="+foodArray[ranNum];
		});
	});
</script>
</head>
<body>
	<jsp:include page="menu.jsp" flush="false"/>
    
    <div class="chooseMenuZone"> 
    	<h2> 한식, 일식, 중식, 양식, 분식, 야식 중에 </h2> <br>
    	<h1> &nbsp; 오늘은 [ <span class="food"> &nbsp; &nbsp;&nbsp; </span> ] 어때요??? </h1>
    	<br>
    	<button class="btnStart" name="start"> 시작! </button>
    	<button class="btnSelect" name="start"> 정하기! </button>
    </div>
    
    <jsp:include page="footer.jsp" flush="false"/>
</body>
</html>
