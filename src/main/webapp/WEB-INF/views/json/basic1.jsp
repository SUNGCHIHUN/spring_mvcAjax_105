<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>basic1</title>
<c:set var="path" value="${pageContext.request.contextPath}" />
<script src="${path}/resources/js/jquery-3.5.1.min.js"></script>
<script>
	$(function() {
		$("#btn").click(function() {
			$.ajax({
				url: "${path}/basic1_next.ja", // 컨트롤러 이동
				type: "GET",
				data: "text", // 요청한 데이터 형식("html", "xml", "json", )
				success: function(result) { // 전송 성공 시 결과가 result로 들어온다.
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
	<h3>basic1</h3>
	<hr><br>
	
	<button id="btn">Ajax 요청!</button>
	<br><br>
	<hr>
	
	<div id="display">
		결과출력위치
	</div>
</body>
</html>