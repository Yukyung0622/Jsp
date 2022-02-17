<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<h2>while문 예제 - 임의의 값을 임의의 횟수로 곱하기</h2>
<%
	int number = Integer.parseInt(request.getParameter("number"));
	int num = Integer.parseInt(request.getParameter("num"));
	
	long multiply =1;
	int count = 0;
	
	while(count<num){
		multiply += number;
		count++;
	}
%>
	<%= multiply %>