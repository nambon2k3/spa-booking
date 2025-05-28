/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Model.Appointment;
import java.sql.*;

/**
 *
 * @author Legion
 */
public class AppointmentDAO extends DBContext {

    private Connection connection;

    public AppointmentDAO() {
        try {
            this.connection = getConnection();
        } catch (Exception e) {
            System.out.println("Connect failed");
        }
    }

    public int insertAppointment(Appointment appointment) {
        String query = "INSERT INTO [Spa].[dbo].[Appointments] "
                + "(UserId, ServiceId, StaffId, RoomId, ScheduledAt, Status, CreatedAt) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?)";

        try (PreparedStatement statement = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS)) {
            statement.setInt(1, appointment.getUserId());
            statement.setInt(2, appointment.getServiceId());
            statement.setInt(3, appointment.getStaffId());
            statement.setInt(4, appointment.getRoomId());
            statement.setTimestamp(5, new java.sql.Timestamp(appointment.getScheduledAt().getTime()));
            statement.setString(6, appointment.getStatus());
            statement.setTimestamp(7, new java.sql.Timestamp(appointment.getCreatedAt().getTime()));

            int rowsInserted = statement.executeUpdate();
            if (rowsInserted > 0) {
                try (ResultSet generatedKeys = statement.getGeneratedKeys()) {
                    if (generatedKeys.next()) {
                        return generatedKeys.getInt(1); // return the generated appointment ID
                    }
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
            // Log or rethrow
        }

        return -1; // or 0 if you prefer that as a default fail value
    }

    public boolean updateAppointmentStatus(int appointmentId, String status) {
        String query = "UPDATE [Spa].[dbo].[Appointments] SET Status = ? WHERE Id = ?";

        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, status);
            statement.setInt(2, appointmentId);

            int rowsUpdated = statement.executeUpdate();
            return rowsUpdated > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            // Handle exception appropriately (e.g., log it or rethrow)
        }

        return false;
    }

}
