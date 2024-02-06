package com.DB;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect {
private static Connection conn;
public static Connection getconn()
{
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/ebook-app","root","root");
		
	} catch (Exception e) {
		// TODO: handle exception
	}
	return conn;
}
}
