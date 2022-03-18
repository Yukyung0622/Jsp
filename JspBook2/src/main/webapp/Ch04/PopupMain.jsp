<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String popupMode = "on";   //레이어 팝업 창 띄울지 여부

Cookie[] cookies = request.getCookies();	//쿠키를 읽어 popupMode 값 생성
if(cookies != null) {
	for (Cookie c : cookies){
		String cookieName = c.getName();
		String cookieValue = c.getValue();
		if(cookieName.equals("PopupClose")){   //"PopupClose" 쿠키가 존재하면
			popupMode = cookieValue;			//popupMode의 값 갱신
		}
	}
}

%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
	    <title>쿠키를 이용한 팝업 관리 ver 0.1</title>
	    <style>  <!--Css로 레이어 팝업창의 위치 지정 -->
	    	div#popup{
	    		position:absolute; top: 100px; left: 50px; color:yellow; width: 270px; height: 100px; background-color: gray; 
	    	}
	    	
	    	div#popup > div {
	    		position: relative; background-color: #ffffff; top: 0px; border: 1px solid gray; padding: 10px; color: black;  
	    	}
	    </style>
	
	
	<!-- JQuery를 이용하는 자바 스크립트 코드 -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script>
		$(function() {
			$('#closeBtn').click(function () {  //닫기 버튼(id="closeBtn")을 누르면
				$('#popup').hide();				//팝업창(id="popup")을 숨긴처리한다 //닫기 버튼을 누르면 실행되는 함수	
				var chkVal = $("input:checkbox[id=inactiveToday]:checked").val();	//체크여부
				
				$.ajax({ 	//jQuery의 ajax() 함수로 비동기 요청	(#비동기로 요청 보냄)
					url : './PopupCookie.jsp',		//요청을 보낼 페이지의 URL 이다. 기본값은 현재페이지 (#PopupCookie.jsp 파일에)
					type : 'get',					//get,post등 http메서드를 지정한다		(#HTTP GET 방식으로)
					data : {inactiveToday : chkVal},	//서버로 보낼 데이터					(#inactiveToday=<chkVal 변수의 값> 데이터를)
					dataType : "text",					//서버로 부터 받을 '응답' 데이터 타입	(#응답 데이터의 타읍은 일반 텍스트이며)
					susses : function (resData) { 	//요청 성공 시 호출되는 함수(콜백함수)		(#요청성공시)
						if(resData != '') location.reload();						//(#응답 데이터가 있다면 페이지를 새로고칩니다.)
					}
				});
				
			});
		});
	
	</script>

	</head>
	<body>
	<h2>팝업 메인 페이지(ver0.1)</h2>
	<%
	  for (int i = 0; i<=10; i++){
		  out.print("현재 팝업창은 "+popupMode+"상태입니다.<br/>");
	  }
	
	  if (popupMode.equals("on")){ 		//popupMode 값이 "on"일 때만 팝업창 표시
	%>
	
	<div id="popup">   <!-- 공지사항 팝업 화면 -->
	 <h2 align="center">공지사항 팝업입니다.</h2>
	 <div align="right"><form action="popFrm">
	 	<input type="checkbox" id="inactiveToday" value="1" />	<!-- 체크박스 -->
	 	하루 동안 열지 않음
	 	<input type="button" value="닫음" id="closeBtn" />		<!-- 닫기화면-->
	 <%
	  }
	 %>
	 </form></div>
	</div>


	</body>
</html>