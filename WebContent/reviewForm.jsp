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
	<% 
		String eateryName = request.getParameter("eateryName");
		String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String)session.getAttribute("userID");
		}
	%>
	<script type="text/javascript">
		var totalRating = 0;
		var eateryName = "<%=eateryName%>";
		var userID = "<%=userID%>";
		$(function() {
			$('#content').keyup(function(e) {
				var content = $(this).val();
				$('#counter').html('(' + content.length + '/500)');
				
				if(content.length > 500) {
					$('#btnSubmit').hide(500);
				} else {
					$('#btnSubmit').show(500);
				}
			});
			
			$("#star_grade a").click(function() {
				$(this).parent().children("a").removeClass("on");
				$(this).addClass("on").prevAll("a").addClass("on");
				
				if($("#star5").attr("class") == "on")
					totalRating = 5;
				else if($("#star4").attr("class") == "on")
					totalRating = 4;
				else if($("#star3").attr("class") == "on")
					totalRating = 3;
				else if($("#star2").attr("class") == "on")
					totalRating = 2;
				else if($("#star1").attr("class") == "on")
					totalRating = 1;
				
				$("#rating").html('('+totalRating+')');
				
				return false;
			});
		});
		
		function proc(result) {
			$("table").remove();
			$("h4").remove();
			var str = "";
			if(result.length == 0) {
				str += "<h4 style='margin: 2% 0%; color: #FF5050'> 아직 리뷰가 없는 음식점입니다. </h4>";
			}
			for(i in result) {
				str += "<table class='reviewTable' id='table'"+i+">";
				str += "<tr><td width='70%'> " + result[i].userID + " </td>";
				str += "<td> <img src='./picture/filledStar.png' width='14px'> " + result[i].rating + ".0 </td>";
				str += "<tr><td colspan ='3' class='content'> " + result[i].content.replaceAll(" ", "&nbsp;").replaceAll("<","&lt;")
				.replaceAll(">", "&gt;").replaceAll("\n","<br/>") + " </td></tr>";
				str += "<tr><td colspan='3' class='date'>" + result[i].reviewDate + "</td></tr>";
				str += "</table>";
			}
			$("#reviewDiv").append(str);
		}
		
		function funcAjax(type, content, order) {
			$.ajax({
				url: "reviewPlusAction.jsp",
				data: {'content' : content, 
					'totalRating' : totalRating, 
					'eateryName' : eateryName,
					'type' : type,
					'order' : order},
				dataType: "json",
				success : function(result) {
					proc(result);
				},
				error : function(request, status, error) {
					alert("데이터를 불러오지 못했습니다.");
				}
			});
		}
		
		$(document).ready(function() {
			funcAjax(2, "", "desc");
			$("#btnSubmit").click(function() {
				var content = $("#content").val();
				var x = document.getElementById("new");
				var y = document.getElementById("asc");
				var z = document.getElementById("desc");
				x.style.fontWeight="bold";
				y.style.fontWeight="normal";
				z.style.fontWeight="normal";
				funcAjax(1, content, "new");
				$("#content").val('');
			});
			$("#desc").click(function() {
				var x = document.getElementById("desc");
				var y = document.getElementById("asc");
				var z = document.getElementById("new");
				x.style.fontWeight="bold";
				y.style.fontWeight="normal";
				z.style.fontWeight="normal";
				funcAjax(2, "", "desc");
			});
			$("#asc").click(function() {
				var x = document.getElementById("asc");
				var y = document.getElementById("desc");
				var z = document.getElementById("new");
				x.style.fontWeight="bold";
				y.style.fontWeight="normal";
				z.style.fontWeight="normal";
				funcAjax(2, "", "asc");
			});
			$("#new").click(function() {
				var x = document.getElementById("new");
				var y = document.getElementById("desc");
				var z = document.getElementById("asc");
				x.style.fontWeight="bold";
				y.style.fontWeight="normal";
				z.style.fontWeight="normal";
				funcAjax(2, "", "new");
			});
			$("#btnDelete").click(function() {
				
				//funcAjax(3, "", "desc");
			});
		})
	</script>
	
	<jsp:include page="menu.jsp" flush="false"/>
    
    <div class="reviewDiv">
    	<h2> <%= eateryName %> </h2>
   	<% 	if (userID != null) {%>
    	<div class="plusReview">
    		<h3> 리뷰 작성 </h3> <br>
    		
    		<h4> 별점을 선택해주세요 </h4>
    		<p id="star_grade">
    			<a href="" id="star1"><img src="./picture/emptyStar.png"></a>
    			<a href="" id="star2"><img src="./picture/emptyStar.png"></a>
    			<a href="" id="star3"><img src="./picture/emptyStar.png"></a>
    			<a href="" id="star4"><img src="./picture/emptyStar.png"></a>
    			<a href="" id="star5"><img src="./picture/emptyStar.png"></a>
    			<span id="rating"> (0) </span>
    		</p>
    		<br>
    		<div class="textareaDiv">
    			<textarea id="content" name="content" placeholder="리뷰는 최대 500자까지 등록 가능합니다."></textarea> <br>
    			<span id="counter">(0/500)</span>
    		</div>
    		<input id="btnSubmit" type="submit" value="등록하기">
		</div>
	<%  } else { %>
			<div class="reviewInfo"> 로그인 후 리뷰를 작성할 수 있습니다. </div>
	<%  } %>
    	<div class="othersReview">
    		<h3> 다른 사람들의 리뷰 </h3> <br> 
    		<button class="btnOrder" id="desc" style="font-weight:bold"> 별점 높은 순 </button> | 
    		<button class="btnOrder" id="asc"> 별점 낮은 순 </button> | 
    		<button class="btnOrder" id="new"> 최신 순 </button>
    		<div id="reviewDiv"></div>
    	</div>
    </div>
    
    <jsp:include page="footer.jsp" flush="false"/>
</body>
</html>