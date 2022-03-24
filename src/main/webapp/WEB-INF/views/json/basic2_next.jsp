<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");

	String name = request.getParameter("name");
	String tel = request.getParameter("tel");
	String address = request.getParameter("address");
	String email = request.getParameter("email");
%>

<!--  방법1. 전달받은 후 표현식으로 출력 -->
NAME : <%=name %><br>
TEL : <%=tel %><br>
ADDRESS : <%=address %><br>
EMAIL : <%=email %><br><br>

<hr><br>

<!-- 방법2 : 전달 받은 후 el 태그로 출력 -->

NAME : ${param.name}<br>
TEL : ${param.tel}<br>
ADDRESS : ${param.address}<br>
EMAIL : ${param.email}<br><br>