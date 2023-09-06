package kr.co.hong;

import java.sql.DriverManager;

import org.junit.Test;

import java.sql.Connection;

public class MYSQLCONTest {

	private static final String DRIVER = "com.mysql.cj.jdbc.Driver";

	private static final String URL = "jdbc:mysql://127.0.0.1:3306/speedwagon?useSSL=false";

	private static final String User = "root";

	private static final String PW = "12345";

	@Test
	public void testConnection() throws Exception {
		Class.forName(DRIVER);

		try(Connection con = DriverManager.getConnection(URL, User, PW)){
			System.out.println(con);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}
		
	}
	
}


