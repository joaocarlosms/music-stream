package br.com.jc.streamusic.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DataSource {
	private String hostname;
	private String username;
	private String password;
	private String database;
	private Connection connection;
	
	
	static {
		
	}
	
	public DataSource() {
		try {
			hostname = "localhost";
			database = "streamusic";
			username = "streamusic";
			password = "root";
			String URL = "jdbc:mysql://"+hostname+":3306/"+database;
			DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
			connection = DriverManager.getConnection(URL, username, password);
			
			System.out.println("Connect database with success!");
		}
		catch(SQLException e) {
			System.out.println("Error connection: "+ e.getMessage());
		}
	}
	
	public Connection getConnection() {
		return this.connection;
	}
}
