<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색 결과 리스트</title>
</head>
<body>
	<h2> 검색 결과 </h2>
	<hr>
		<form name="form1" method="post">
			<!-- 반복문을 돌면서 검색 결과 리스트 출력 -->		
			<c:forEach var="search" items="${slist}" >
				<p style="font-size: 25px;">${search.keyword}</p>
			</c:forEach>
		</form>
</body>
</html>