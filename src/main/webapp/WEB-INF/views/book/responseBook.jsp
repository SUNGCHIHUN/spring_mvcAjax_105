<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>responseBook</title>
<c:set var="path" value="${pageContext.request.contextPath}" />
<script src="${path}/resources/js/request.js"></script>
<script>

	function load() {
		sendRequest(printBookInfo, "${path}/bookInfo.do", "POST", null);
	}
	
	function printBookInfo() {
		var result = document.getElementById("book_result");
		
		// 데이터 취득완료 후 응답 준비 완료
		if (httpRequest.readyState == 4) {
			// 정상종료
			if (httpRequest.status == 200) {
				
				// 1. 결과 데이터를 받는다.
				var data = new Array;
				data = httpRequest.responseText;
				
				// 2. 데이터를 | 기준으로 나누어 bookList 배열에 담는다.
				var list = data.split("|");
				
				// 3. 북리스트 데이터들을 , 기준으로 나누고 다시 담는다.
				var bookList = "";
				for (var i=0; i<list.length; i++) {
					var array = list[i].split(", ");
					bookList += "제목 : " + array[0] + "<br>"
						         +  "저자 : " + array[1] + "<br>"
						         +  "가격 : " + array[2] + "<br><br>";
				}
				
				result.innerHTML = bookList;
				
			// 비정상종료
			} else {
				result.innerHTML = "status : " + httpRequest.status;
				
			}
		} else {
			result.innerHTML = "readyState : " + httpRequest.readyState;
		}
	}

</script>
</head>
<body>
	
	<h3> 베스트셀러 목록 </h3>
	<hr><br>
	
	<input type="button" value="확인" onclick="load();">
	<br><br>
	
	<hr>
	<div id="book_result">
		결과출력 위치
	</div>
	
</body>
</html>