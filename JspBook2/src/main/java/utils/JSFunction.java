package utils;

import javax.servlet.jsp.JspWriter;		//�ʿ��� Ŭ���� ����Ʈ

public class JSFunction {
	
	//�޽��� �˸�â�� ��� �� ����� URL�� �̵��մϴ�.
	public static void alertLocation(String msg, String url, JspWriter out) {
		try {
			String script = ""				//������ �ڹٽ�ũ��Ʈ �ڵ�
						  +"<script>"				
						  +"		alert('" + msg + "');"				//�˸�â�� ��� �޼���
						  +"		location.href='" + url +"';"		//�˸�â�� ���� �� �̵��� �������� URL
						  +"</script>";
			out.print(script); 		//�ڹٽ�ũ��Ʈ �ڵ带 out ���尴ü�� ���(����)
		}
		catch (Exception e) {}

		}
		
		//�޼��� �˸�â�� ��� �� ���� �������� ���ư��ϴ�.
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
