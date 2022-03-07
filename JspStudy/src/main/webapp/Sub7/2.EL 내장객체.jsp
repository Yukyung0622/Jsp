<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<!-- 
			날짜 : 2022/03/07
			이름 : 김유경
			내용 : JSP 표현언어 내장객체
		 -->
		<meta charset="UTF-8">
	    <title>2.EL 내장객체</title>

	</head>
	<body>
		<h3>2.표현언어 내장객체</h3>
		<%
			pageContext.setAttribute("name", "김유신");
			request.setAttribute("name", "김춘추");
			session.setAttribute("name", "장보고");
			application.setAttribute("name", "강감찬");
		%>
		
		<p>
			pageContext name : ${pageScope.name}<br/>
			request name : ${requestScope.name}<br/>
			session name : ${sessionScope.name}<br/>
			application name : ${applicationScope.name}<br/>
		</p>
		
		<h4>header 내장객체</h4>
		<p>
			헤더정보 : ${header['user-agent']}
		</p>

	</body>
</html>