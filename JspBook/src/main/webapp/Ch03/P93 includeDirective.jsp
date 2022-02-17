<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%

	String bodyback_c="e0fff";
	String back_c = "8fbc8f";
	String title_c = "#8fbc8f";
	String value_c = "#60e0e6";
	String bar = "#778899";

%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
	    <title>include 디렉티브</title>

	</head>
	<body bgcolor = "<%=bodyback_c%>">
	<form action="">
		<dl>
			<dd>
				<lable for = "id">아이디</lable>
				<input id = "id" type="email" placeholder="ddd@aaa.com" required>
			</dd>
			<dd>
				<lable for = "pass">비밀번호</lable>
				<input id = "pass" type="text" placeholder="비밀번호" required>
			</dd>
			<dd>
				<lable for = "name">이름</lable>
				<input id = "name" type="text" placeholder="홍길동" required>
			</dd>
			<dd>
				<input type ="submit" value="등록">
			</dd>
		</dl>
	</form>


	</body>
</html>