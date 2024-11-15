package dbConnection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
	public static final String HOST_ADDERSS = "192.168.18.245";
	public static final String PORT = "3306";
	public static final String DATABASE = "spectbih_freddy";
	public static final String USERNAME = "spectbih_freddy";
	public static final String PASSWORD = "Fr3EDdy.Sp3C24K";

	private static final String URL = "jdbc:mysql://" + HOST_ADDERSS + ":" + PORT + "/" + DATABASE;

	public static Connection getConnection() throws SQLException {
		try {
			Class.forName("com.mysql.jdbc.Driver");

		} catch (ClassNotFoundException e) {
			System.out.println("Driver not found: " + e.getMessage());
		}
		return DriverManager.getConnection(URL, USERNAME, PASSWORD);
	}

}
