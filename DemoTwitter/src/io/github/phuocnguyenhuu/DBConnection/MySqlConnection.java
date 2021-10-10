package io.github.phuocnguyenhuu.DBConnection;

import java.sql.*;

public class MySqlConnection {
	private String hostName = "jdbc:mysql://localhost:3306/mydb";
	private String userName = "root";
	private String userPassword = "admin";
	public Statement statement;
	private Connection con;

	public MySqlConnection() {
		this.con = null;
		this.statement = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			this.con = DriverManager.getConnection(hostName, userName, userPassword);
			this.statement = this.con.createStatement();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
}
