<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>basic2</title>
<c:set var="path" value="${pageContext.request.contextPath}" />
<script src="${path}/resources/js/jquery-3.5.1.min.js"></script>
<script>
	$(function() {
		$("#btn").click(function() {

			var param = {};
			param.name = "아이유";
			param.tel = "010-1234-1234"
			param.address = "텍사스";
			param.email = "iu1234@naver.com";
			
			$.ajax({
				url: "${path}/basic2_next.ja",
				type: "post",
				data: param,
				success: function(result) {
					$("#display").html(result);
				},
				error: function() {
					alert("오류!");
				}
			});
		});
	});

</script>
</head>
<body>
	<h3>basic2</h3>
	<hr><br>
	
	<button id="btn">Ajax 요청!</button>
	<br><br>
	<hr>
	
	<div id="display">
		결과출력위치
	</div>
	
</body>
</html>