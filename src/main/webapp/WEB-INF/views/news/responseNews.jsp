<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>뉴스</title>
<script src="/ajax_105/resources/js/request.js"></script>
<script type="text/javascript">

	// [3]번째 실행
	function load(url) {
		
		// sendRequest(callback, url, method, params);
		// [4]번째 실행. url : news1.do => AjaxController의 url.equals("/news1.do");로 이동
		//                [6]          [5]
		sendRequest(loadNews, url, "POST", null);
	}

	// 콜백함수 : news1.jsp 페이지로 이동해서 결과를 받고 다시 돌아온다.
	// [6]번째 실행
	function loadNews() {
	
		var result = document.getElementById("result");
		
		// 4: completed - 전체 데이터를 성공적으로 취득완료하면
		if (httpRequest.readyState == 4) {
			// 200: 정상종료
			if (httpRequest.status == 200) {
				result.innerHTML = "정상종료";
				// [6-1]번째 실행. 응답결과가 html이면 responseText로 받고
				//                                 XML이면 responseXml로 받는다.
				result.innerHTML = httpRequest.responseText;
				
			// 비정상 종료	
			} else {
				result.innerHTML = "status 상태 : " + httpRequest.status;
			}
		// 전체 데이터 취득 실패
		} else {
			result.innerHTML = "readyState 상태 : " + httpRequest.readyState;
		}
	}
</script>
</head>
<body>

	<!-- [2]번째 실행부분 -->
	<h3> 오늘의 뉴스 </h3>
	<a onclick="load('news1.do');">[아름다운건축] 1인 가구와 원룸</a><br>
	<a onclick="load('news2.do');">[기고] 국민연금공단의 1-10-100 프로젝트</a><br>
	<a onclick="load('news3.do');">[송평인 칼럼] 어퍼컷 대 하이킥</a><br>
	<hr>

	<div id="result">
		결과 출력 위치
	</div>
</body>
</html>