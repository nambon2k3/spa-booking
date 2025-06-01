/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Model.Appointment;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Date;

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

    public boolean updateScheduledAt(int appointmentId, Date scheduledAt) {
        String sql = "UPDATE Appointments SET scheduledAt = ? WHERE id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {

            stmt.setTimestamp(1, new java.sql.Timestamp(scheduledAt.getTime()));
            stmt.setInt(2, appointmentId);

            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<Appointment> getAppointmentsByUserId(int userId, String status, int page) {
        List<Appointment> appointments = new ArrayList<>();
        String sql = "SELECT * FROM Appointments WHERE userId = ? ";

        if (status != null) {
            sql += " AND status = ? ";
        }

        sql += " ORDER BY scheduledAt DESC OFFSET ? ROWS FETCH NEXT 5 ROWS ONLY";

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {

            int offset = (page - 1) * 5;

            stmt.setInt(1, userId);
            if (status != null) {
                stmt.setString(2, status);
                stmt.setInt(3, offset);

            } else {
                stmt.setInt(2, offset);

            }

            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Appointment appointment = new Appointment();
                    appointment.setId(rs.getInt("id"));
                    appointment.setUserId(rs.getInt("userId"));
                    appointment.setServiceId(rs.getInt("serviceId"));
                    appointment.setStaffId(rs.getInt("staffId"));
                    appointment.setRoomId(rs.getInt("roomId"));
                    appointment.setScheduledAt(rs.getTimestamp("scheduledAt"));
                    appointment.setStatus(rs.getString("status"));
                    appointment.setCreatedAt(rs.getTimestamp("createdAt"));

                    appointments.add(appointment);
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return appointments;
    }

    public int countAppointmentsByUserId(int userId, String status) {
        int count = 0;
        String sql = "SELECT COUNT(*) FROM Appointments WHERE userId = ?";
        if (status != null && !status.isEmpty()) {
            sql += " AND status = ?";
        }

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, userId);
            if (status != null && !status.isEmpty()) {
                stmt.setString(2, status);
            }

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    count = rs.getInt(1);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return count;
    }

    public boolean updateStatus(int appointmentId, String status) {
        String sql = "UPDATE Appointments SET status = ? WHERE id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {

            stmt.setString(1, status);
            stmt.setInt(2, appointmentId);

            return stmt.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

}
