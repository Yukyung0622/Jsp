package utils;

import javax.servlet.jsp.JspWriter;		//필요한 클래스 임포트

public class JSFunction {
	
	//메시지 알림창을 띄운 후 명시한 URL로 이동합니다.
	public static void alertLocation(String msg, String url, JspWriter out) {
		try {
			String script = ""				//삽입할 자바스크립트 코드
						  +"<script>"				
						  +"		alert('" + msg + "');"				//알림창에 띄울 메세지
						  +"		location.href='" + url +"';"		//알림창을 닫은 후 이동할 페이지의 URL
						  +"</script>";
			out.print(script); 		//자바스크립트 코드를 out 내장객체로 출력(삽입)
		}
		catch (Exception e) {}

		}
		
		//메세지 알림창을 띄운 후 이전 페이지로 돌아갑니다.
		public static void alertBack (String msg, JspWriter out) {
			try {
				String script = ""
						  +"<script>"
						  +"		alert('" + msg + "');"
						  +"		history.back();"
						  +"</script>";
			out.print(script);
		}
		catch (Exception e) {}
			
		}
	}
