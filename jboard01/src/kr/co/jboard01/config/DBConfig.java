package kr.co.jboard01.config;
//1�ܰ� 2�ܰ�
import java.sql.Connection;
import java.sql.DriverManager;

public class DBConfig {
	
	private static final String HOST = "jdbc:mysql://192.168.0.178:3306/lhj";
	private static final String USER = "lhj";
	private static final String PASS = "1234";	
	
	public static Connection getConnect() throws Exception{
		
		//1�ܰ�
		Class.forName("com.mysql.jdbc.Driver");
		//2�ܰ�
		Connection conn = DriverManager.getConnection(HOST, USER, PASS);
		
		return conn;
	}

}
