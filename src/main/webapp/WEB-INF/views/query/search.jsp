<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색</title>
<script src="${path}/resources/js/jquery-3.5.1.min.js"></script>
<script>
	$(function() {
		$("#keyword").keyup(function() { /* 키워드 입력이 끝났을 때 */
			var keyword = $("#keyword").val(); /* input 태그에서 입력한 키워드 */
			
			// 검색한 글자수가 0인 경우
			if(keyword.length == 0) {
				$("#display").css("visibility", "hidden"); // 숨김
			
			// 검색한 글자가 있는 경우
			} else {
				$("#display").css("visibility", "visible"); // 표시					
				
				// js의 sendRequest(callback, url, method, params);
				// callback을 가장 나중에 쓴다.
				$.ajax({
					url: "${path}/search_next.ja",
					type: "POST",
					data: "keyword=" + keyword,
					success: function(result) {    // callback 함수, result 변수에 httpRequest.responseText
						$("#display").html(result); // innerHTML() 				   httpRequest.responseXml 값이 온다.
					},
					error: function() { // readyState == 4, status == 200 이 아닌 경우 
						alert("에러 발생!!");
					}
				});
			}
			
		});
	});
</script>
</head>
<body>
	
	<h3> Ajax 방식 </h3>
	<form name="searchform" method="post" action="${path}/search_next.ja">
		검색할 단어를 입력하세요. <br>
		<%-- SearchDTO에서 준 keyword와 id 또는 name을 일치시켜야 한다. --%>
		<input type="text" id="keyword" name="keyword">
		
		<div id="display">
			<!-- 결과 출력 위치 -->
		</div>

	</form>
	
</body>
</html>