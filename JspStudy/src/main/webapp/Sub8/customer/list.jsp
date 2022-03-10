 <%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8"/>
		<title>list</title>
	</head>
	<body>
		<h3>고객목록</h3>
		<a href="/JspStudy/Sub8/customer/register.do">고객 등록하기</a>
		<table border="1">
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>주소</th>
				<th>휴대폰</th>
				<th>관리</th>
			</tr>
				<tr>
					<td>${customer.custid}</td>
					<td>${customer.name}</td>
					<td>${customer.address}</td>
					<td>${customer.phone}</td>
					<td>
						<a href="/JspStudy/Sub8/customer/modify.do?uid=${customer.custid}">수정</a>
						<a href="/JspStudy/Sub8/customer/delete.do?uid=${customer.custid}">삭제</a>
					</td>			
				</tr>
		</table>		
	</body>
</html>