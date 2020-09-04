package com.test.user.main;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


/**
 * @author leeho
 * 데이터베이스 연결 클래스
 */
public class DBUtil {

	private Connection conn = null;
	
	/**
	 * 서버에 연결합니다.
	 * 
	 * @param host 서버 주소
	 * @param id   계정명
	 * @param pw   비밀번호
	 * @return 연결 객체를 반환합니다.
	 */
	public Connection open() {

		String url = "jdbc:oracle:thin:@mhurry.cmtestbsoa7f.ap-northeast-2.rds.amazonaws.com:1521:mhurry";
		String id = "admin";
		String pw = "markethurry";

		try {

			Class.forName("oracle.jdbc.driver.OracleDriver");

			conn = DriverManager.getConnection(url, id, pw);

			return conn;

		} catch (Exception e) {
			System.out.println("DBUtil.getConnection()");
			e.printStackTrace();
		}

		return null;

	}// open

	/**
	 * 연결을 종료합니다.
	 */
	public void close() {
		try {
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}// close

}
