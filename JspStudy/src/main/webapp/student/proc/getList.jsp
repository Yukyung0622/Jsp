<%@page import="java.sql.Statement"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bean.studentBean"%>
<%@page import="java.util.List"%>
<%@ page contentType="application/json;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 데이터베이스 작업(Statement 사용)
	String host = "jdbc:mysql://chhak.or.kr:3306/kkomang0622";
	String user = "kkomang0622";
	String pass = "1234";
	
	List<studentBean> students = new ArrayList<>();
	
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection(host, user, pass);
		Statement stmt = conn.createStatement();
		
		String sql = "SELECT * FROM `Students`";
		ResultSet rs = stmt.executeQuery(sql);
		
		while(rs.next()){
			
			studentBean sb = new studentBean();
			sb.setSid(rs.getString(1));
			sb.setName(rs.getString(2));
			sb.setGender(rs.getString(3));
			sb.setHp(rs.getString(4));
			sb.setGrade(rs.getInt(5));
			sb.setRegdate(rs.getString(6));
			
			students.add(sb);
		}
		
		conn.close();
		
	}catch(Exception e){
		e.printStackTrace();
	}
	
	// Json 데이터 출력
	Gson gson = new Gson();
	
	String jsonData = gson.toJson(students);
	out.print(jsonData);
		
%>

