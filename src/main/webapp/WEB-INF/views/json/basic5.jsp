<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>basic5</title>
<c:set var="path" value="${pageContext.request.contextPath}" />
<script src="${path}/resources/js/jquery-3.5.1.min.js"></script>
<script>
	$(function() {
		$("#btn").click(function() {
			// 따옴표를 반대로하면 Unexpected character (') at position 1 오류발생
			var _jsonInfo = '{"name" : "아이유", "tel" : "010-3333-3333",	"address" : "서울시 금천구", "email" : "iyou@naver.com"}';
			$.ajax({
				url: "${path}/basic5_next.ja",
				type: "POST",
				data: {jsonInfo : _jsonInfo},
				success: function(result) {
					$("#display").html(result);
				},
				error: function(request, status, error) {
					alert("오류 발생!");
					console.log("code : " + request.status);
					console.log("message : " + request.responseText);
					console.log("error : " + error);
				}
				
			});			
		});
	});

</script>
</head>
<body>
	<h3>basic5</h3>
	<hr><br>
	
	<button id="btn">Ajax 요청!</button>
	<br><br>
	<hr>
	
	<div id="display">
		결과출력위치
	</div>
</body>
</html>