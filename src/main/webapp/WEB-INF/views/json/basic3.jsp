<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>basic3</title>
<c:set var="path" value="${pageContext.request.contextPath}" />
<script src="${path}/resources/js/jquery-3.5.1.min.js"></script>
<script>
	// dataType: xml인 경우
	$(function() {
		$("#btn").click(function() {
			
			// basic3_data.xml => result => 콜백함수로 전달 => 파싱해서 데이터누적 => display에 출력
			// 파싱 어떤 페이지(문서, html 등)에서 내가 원하는 데이터를 특정 패턴이나 순서로 추출해 가공하는 것
			$.ajax({
				// new => other => xml => XML File => basic3_data.xml
				url: "${path}/resources/data/basic3_data.xml",
				type: "GET",
				dataType: "xml",
				success: function(result) {
					var strText = "";
					$(result).find("holiday").each(function() {
						var item_text = $(this).text(); // 실제값을 파싱 => 가장먼저 삼일절
						strText += item_text + "<br>";
					});

					$("#display").html(strText);
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
	<h3>basic3</h3>
	<hr><br>
	
	<button id="btn">Ajax 요청!</button>
	<br><br>
	<hr>
	
	<div id="display">
		결과출력위치
	</div>
	
</body>
</html>