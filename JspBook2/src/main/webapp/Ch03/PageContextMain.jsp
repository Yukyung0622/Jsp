<%@ page import="common.Person" %>		<!-- common.Person임포트 -->
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
//속성저장
pageContext.setAttribute("pageInteger", 1000);
pageContext.setAttribute("pageString", "페이지 영역의 문자열");
pageContext.setAttribute("pagePerson", new Person("한석봉", 99));
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
	    <title>page  영역의 속성값 읽기</title>

	</head>
	<body>
	<h2>page 영역의 속성값 읽기</h2>
	
	<%
	//속성읽기
	int pInteger = (Integer)(pageContext.getAttribute("pageInteger"));
	String pString = pageContext.getAttribute("pageString").toString();
	Person pPerson = (Person)(pageContext.getAttribute("pagePerson"));
	%>
	
	<ul>
		<li>Integer객체 : <%=pInteger %><li>
		<li>String객체 : <%=pString %><li>
		<li>Person객체 : <%=pPerson.getName() %>, <%=pPerson.getAge() %><li>
	</ul>
	
	<h2>include된 파일에서 page 영역 읽어오기</h2>
	<%@ include file="PageInclude.jsp" %>
	
	<h2>페이지 이동 후 page 영역 일어오기</h2>
	<a href="PageLocation.jsp">PageLocation.jsp</a>


	</body>
</html>