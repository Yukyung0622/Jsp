package kr.co.farmstory2.config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConfig {

	//�̱��� ��ü
	private static DBConfig instance = new DBConfig();
		
	public static DBConfig getInstance() {
		return instance;
	}
	
	private DBConfig() {}
	
	//���߿�
	private final String HOST = "jdbc:mysql://chhak.or.kr:3306/kkomang0622";
	private final String USER = "kkomang0622";
	private final String PASS = "1234";
	
	//root��
//	private final String HOST = "jdbc:mysql://localhost:3306/kkomang0622";
//	private final String USER = "root";
//	private final String PASS = "1234";
	
//	//������
//	private final String HOST = "jdbc:mysql://localhost:3306/kkomang0622";
//	private final String USER = "test";
//	private final String PASS = "1234";
	
	public Connection getConnection() throws Exception {
		
		//1�ܰ�
		Class.forName("com.mysql.jdbc.Driver");
		//2�ܰ�
		Connection conn = DriverManager.getConnection(HOST, USER, PASS);
		return conn;
	}
}
