package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.mindrot.jbcrypt.BCrypt;

import bean.User;
import dbConnection.DBConnection;

public class UserDAO {

	 // Method to check if email already exists
    public boolean doesEmailExist(String email) {
        String SELECT_EMAIL_SQL = "SELECT COUNT(*) FROM beachybay_users WHERE email = ?";
        
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_EMAIL_SQL)) {
            
            preparedStatement.setString(1, email);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                return resultSet.getInt(1) > 0; // Returns true if email exists
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false; // Email does not exist
    }

    // Register user after checking if email exists and hash the password
    public boolean registerUser(User user) {
        if (doesEmailExist(user.getEmail())) {
            return false; // Email already exists
        }

        // Hash the password using BCrypt before storing it
        //String hashedPassword = BCrypt.hashpw(user.getPassword(), BCrypt.gensalt());
        
        String INSERT_USER_SQL = "INSERT INTO beachybay_users (email, password) VALUES (?, ?)";
        
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USER_SQL)) {

            preparedStatement.setString(1, user.getEmail());
            preparedStatement.setString(2, user.getPassword()); // Store hashed password

            int result = preparedStatement.executeUpdate();
            return result > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
    // Method to validate user (check email and password)
    public boolean validateUser(User user) {
        String SELECT_USER_SQL = "SELECT password FROM beachybay_users WHERE email = ?";
        
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_SQL)) {
            
            preparedStatement.setString(1, user.getEmail());
            
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                // Get the hashed password from the database
                String storedHashedPassword = resultSet.getString("password");
                
                // Check if the entered password matches the stored hashed password
                if (BCrypt.checkpw(user.getPassword(), storedHashedPassword)) {
                    return true; // Valid user
                }
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false; // Invalid email or password
    }
    
    
	/*
	 * public User getUserByEmail(String email) { String SELECT_USER_SQL =
	 * "SELECT email, password FROM beachybay_users WHERE email = ?"; User user =
	 * null;
	 * 
	 * try (Connection connection = DBConnection.getConnection(); PreparedStatement
	 * preparedStatement = connection.prepareStatement(SELECT_USER_SQL)) {
	 * 
	 * preparedStatement.setString(1, email); ResultSet resultSet =
	 * preparedStatement.executeQuery();
	 * 
	 * if (resultSet.next()) { user = new User();
	 * user.setEmail(resultSet.getString("email"));
	 * user.setPassword(resultSet.getString("password")); // Password is hashed }
	 * 
	 * } catch (SQLException e) { e.printStackTrace(); }
	 * 
	 * return user; }
	 */
    
    public User getUserByEmail(String email) {
        String SELECT_USER_SQL = "SELECT email, password FROM beachybay_users WHERE email = ?";
        User user = null;

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_SQL)) {

            preparedStatement.setString(1, email);
            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                user = new User();
                user.setEmail(resultSet.getString("email"));
                user.setPassword(resultSet.getString("password")); // This should be the hashed password
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return user;
    }


}
