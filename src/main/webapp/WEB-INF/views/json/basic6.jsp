<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>basic6</title>
<c:set var="path" value="${pageContext.request.contextPath}" />
<script src="${path}/resources/js/jquery-3.5.1.min.js"></script>
<script>
	// data가 json인 경우
	// basic6 -> jsonData -> {컨트롤러}/basic6_next -> 콜백함수 result -> jsonData 
	$(function() {
		$('#btn').click(function() {
			
			// 자바스크립트 객체
			var hong = new Object();
			hong.id = 'hong';
			hong.password = 'hong1234';
			hong.name = '홍길동';
			
			// 자바 객체를 String 객체로 변환
			var jsonData = JSON.stringify(hong);
			
			$.ajax({
				url: '${path}/basic6_next.ja',
				type:'POST',
				data: jsonData,
				contentType: 'application/json;charset=UTF-8;',
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
	<h3>basic6</h3>
	<hr><br>
	
	<button id="btn">Ajax 요청!</button>
	<br><br>
	<hr>
	
	<div id="json_result">
		결과출력위치
	</div>
</body>
</html>