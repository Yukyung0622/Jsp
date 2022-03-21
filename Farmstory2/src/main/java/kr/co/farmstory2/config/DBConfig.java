package kr.co.farmstory2.config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConfig {

	//싱글톤 객체
	private static DBConfig instance = new DBConfig();
		
	public static DBConfig getInstance() {
		return instance;
	}
	
	private DBConfig() {}
	
	//개발용
	private final String HOST = "jdbc:mysql://chhak.or.kr:3306/kkomang0622";
	private final String USER = "kkomang0622";
	private final String PASS = "1234";
	
	//root용
//	private final String HOST = "jdbc:mysql://localhost:3306/kkomang0622";
//	private final String USER = "root";
//	private final String PASS = "1234";
	
//	//배포용
//	private final String HOST = "jdbc:mysql://localhost:3306/kkomang0622";
//	private final String USER = "test";
//	private final String PASS = "1234";
	
	public Connection getConnection() throws Exception {
		
		//1단계
		Class.forName("com.mysql.jdbc.Driver");
		//2단계
		Connection conn = DriverManager.getConnection(HOST, USER, PASS);
		return conn;
	}
}
