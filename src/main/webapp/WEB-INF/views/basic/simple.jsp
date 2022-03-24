<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ajax</title>
<script src="/ajax_105/resources/js/jquery-3.5.1.min.js"></script>
<script src="/ajax_105/resources/js/request.js"></script>
<script>
	function show() {
		
		// 서버로 요청해서 통신한 후 응답을 콜백함수로 돌려받겠다.
		// function sendRequest(콜백함수명, 응답url, method, params) {} // 콜백함수명은 () 없음
		// function sendRequest(callback, url, method, params) {}
		// post방식이라 param = null	
		sendRequest(simple_callback, "/jsp_pj_105/simple.do", "post", null); // simple.do => 컨트롤러
	}
	
	// 콜백함수로 결과를 받음
	// 서버로부터 응답이 오면 동작할 함수(비동기 함수를 관리하는 XMLHttpRequest가 호출)
	// 콜백함수명은 sendRequest(콜백함수명)과 일치해야한다.
	function simple_callback() {
		
		// 아이디가 simple_result 요소
		var result = document.getElementById("simple_result");
		
		if(httpRequest.readyState == 4) { // 4 : completed => 전체 데이터가 취득완료된 상태
			if(httpRequest.status == 200) { // 200 : 정상종료
				// result.innerHTML = "정상종료";
				var msg = "이름 : " + document.inputform.username.value;
				result.innerHTML = msg;
				
			// 비정상 종료
			} else {
				result.innerHTML = "status 상태 : " + httpRequest.status;
			}
		
		// 데이터 누락
		} else {
			result.innerHTML = "readyState 상태 : " + httpRequest.readyState;
		}	
	}
	
</script>
</head>
<body>

	<h3> Ajax(Asynchronos Javascript And XML, 비동기적인 자바스크립트와 XML) </h3>

	<form name="inputform" method="post">
		<table>
			<tr>
				<th> 이름 </th>
				<td> <input type="text" name="username" value="홍길동"> </td>
			</tr>
			<tr>
				<td colspan="2"> <input type="button" value="확인" onclick="show()"> </td>
			</tr>
		</table>
	</form>
	
	<br><br><br>
	<hr>
	
	<!-- 결과 출력 위치 -->
	<div id="simple_result"> 결과 출력 위치 </div>
	
</body>
</html>