package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import bean.BookingDetails;
import dbConnection.DBConnection;

public class BookingDAO {
    
	 public boolean saveBookingDetails(BookingDetails bookingDetails) {
	        Connection conn = null;
	        PreparedStatement stmt = null;
	        boolean result = false;

	        try {
	            // Use DBConnection to get the connection
	            conn = DBConnection.getConnection(); 
	            
	            // SQL query for inserting data
	            String query = "INSERT INTO BeachyBay_bookings (first_name, last_name, email, room_type, guests, arrival_date, arrival_time, time_period, departure_date, special_requests) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
	            stmt = conn.prepareStatement(query);

	            // Set parameters for the query
	            stmt.setString(1, bookingDetails.getFirstName());
	            stmt.setString(2, bookingDetails.getLastName());
	            stmt.setString(3, bookingDetails.getEmail());
	            stmt.setString(4, bookingDetails.getRoomType());
	            stmt.setInt(5, bookingDetails.getGuests());
	            stmt.setString(6, bookingDetails.getArrivalDate());
	            stmt.setString(7, bookingDetails.getArrivalTime());
	            stmt.setString(8, bookingDetails.getTimePeriod());
	            stmt.setString(9, bookingDetails.getDepartureDate());
	            stmt.setString(10, bookingDetails.getSpecialRequests());

	            // Execute the query and check if the insert was successful
	            int rowsAffected = stmt.executeUpdate();
	            result = rowsAffected > 0;  // If the insert was successful

	        } catch (SQLException e) {
	            e.printStackTrace();  // Print the error if any
	        } finally {
	            try {
	                // Close resources to avoid memory leaks
	                if (stmt != null) stmt.close();
	                if (conn != null) conn.close();
	            } catch (SQLException e) {
	                e.printStackTrace();
	            }
	        }
	        return result; // Return whether the insert was successful or not
	    }
}
