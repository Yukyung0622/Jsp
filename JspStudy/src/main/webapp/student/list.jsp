<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8"/>
		<title>list</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<script>
			$(function(){
				
				//학생 목록 불러오기 버튼 클릭
				$('button').click(function(){
					
					$.get('./proc/getList.jsp', function(data){
						
						for(let student of data){
							$('table').append('<tr/>');
							$('table tr:last-child').append('<td>'+student.sid+'</td>');
							$('table tr:last-child').append('<td>'+student.name+'</td>');
							$('table tr:last-child').append('<td>'+student.gender+'</td>');
							$('table tr:last-child').append('<td>'+student.hp+'</td>');
							$('table tr:last-child').append('<td>'+student.grade+'</td>');							
							$('table tr:last-child').append('<td>'+student.regdate.substring(2,10)+'</td>');							
						};
					});
				});
			});
				
		</script>
		
	</head>
	<body>
		<h3>학생목록</h3>
		<button>학생목록 불러오기</button>
		<a href="./register.jsp">학생등록</a>
		<table border="1">
			<tr>
				<th>학번</th>
				<th>이름</th>
				<th>성별</th>
				<th>휴대폰</th>
				<th>학년</th>
				<th>등록일</th>
			</tr>
		</table>		
	</body>
</html>

