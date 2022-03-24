<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>basic4</title>
<c:set var="path" value="${pageContext.request.contextPath}" />
<script src="${path}/resources/js/jquery-3.5.1.min.js"></script>
<script>
	// dataType: xml인 경우
	$(function() {
		$("#btn").click(function() {
			var obj = new Object();
			var result = "";
			
			$.ajax({
				// new => other => xml => XML File => basic3_data.xml
				url: "${path}/resources/data/basic4_json.js",
				type: "GET",
				dataType: "json",
				success: function(obj) {
					for (var i=0; i<obj.length; i++) {
						result += obj[i].name + "<br>"
						        + obj[i].tel + "<br>"
						        + obj[i].address + "<br>"
						        + obj[i].email + "<br><br>";
					}
					
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
<!-- 
	* JSON
	- 자바스크립트 객체 표기법을 JSON(Java Script Object Notation)
	- JSON은 데이터를 전달할 때 사용하는 표준형식
	- 속성(KEY)과 값(VALUE)이 하나의 쌍을 이룬다.
	
	기본형 : {"속성1", 값1, "속성2", 값2, ... "속성n": 값n}
	복수형 : [{"속성1", 값1, "속성2", 값2, ... "속성n": 값n}, {"속성1", 값1, "속성2", 값2, ... "속성n": 값n}]
	
 -->
	<h3>basic4</h3>
	<hr><br>
	
	<button id="btn">Ajax 요청!</button>
	<br><br>
	<hr>
	
	<div id="display">
		결과출력위치
	</div>
	
</body>
</html>