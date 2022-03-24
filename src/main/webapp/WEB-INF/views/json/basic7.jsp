<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>basic7</title>
<c:set var="path" value="${pageContext.request.contextPath}" />
<script src="${path}/resources/js/jquery-3.5.1.min.js"></script>
<script>
	// get방식
	$(function() {
		$('#btn').click(function() {
			$.ajax({
				url: '${path}/basic7_next.ja?mode=happy',
				type:'GET',
				success: function(result) {
					$('#json_result').html(result);					
				},
				error: function() {
					alert('에러발생!');
				}
			});
		});
	});
</script>
</head>
<body>
	<h3>basic7</h3>
	<hr><br>
	
	<button id="btn">Ajax 요청!</button>
	<br><br>
	<hr>
	
	<div id="json_result">
		결과출력위치
	</div>
</body>
</html>