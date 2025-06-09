/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Model.SpaService;
import java.util.ArrayList;
import java.util.List;
import java.sql.PreparedStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Admin
 */
public class SpaServiceDAO extends DBContext {

    private Connection connection;

    public SpaServiceDAO() {
        try {
            this.connection = getConnection();
        } catch (Exception e) {
            System.out.println("Connect failed");
        }
    }

    public List<SpaService> getTopSpaServices(int i) {
        List<SpaService> list = new ArrayList<>();
        String sql = "SELECT TOP " + i + " * FROM SpaService WHERE IsActive = 1";
        try (PreparedStatement statement = connection.prepareStatement(sql); ResultSet rs = statement.executeQuery()) {

            while (rs.next()) {
                SpaService spaService = new SpaService(
                        rs.getInt("Id"),
                        rs.getString("Name"),
                        rs.getString("Description"),
                        rs.getInt("DurationMinutes"),
                        rs.getBigDecimal("Price"),
                        rs.getString("Image")
                );
                list.add(spaService);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<SpaService> getActiveSpaServices(int page) {
        List<SpaService> services = new ArrayList<>();
        String sql = "SELECT * FROM spaservice WHERE isactive = 1 ORDER BY id OFFSET ? ROWS FETCH NEXT 6 ROWS ONLY";

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {

            int offset = (page - 1) * 6;
            stmt.setInt(1, offset);

            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    SpaService service = new SpaService();
                    service.setId(rs.getInt("id"));
                    service.setName(rs.getString("name"));
                    service.setDescription(rs.getString("description"));
                    service.setDurationMinutes(rs.getInt("durationminutes"));
                    service.setPrice(rs.getBigDecimal("price"));
                    service.setActive(rs.getBoolean("isactive"));
                    service.setCategoryId(rs.getInt("categoryid"));
                    service.setImage(rs.getString("image"));

                    services.add(service);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace(); // hoặc xử lý logging
        }

        return services;
    }

    public List<SpaService> getFilteredSpaServices(
            String name,
            String durationRange,
            Double minPrice,
            Double maxPrice,
            Integer categoryId,
            Boolean isActive,
            int page,
            int pageSize
    ) {
        List<SpaService> services = new ArrayList<>();
        StringBuilder sql = new StringBuilder("SELECT * FROM spaservice WHERE 1=1");

        if (name != null && !name.trim().isEmpty()) {
            sql.append(" AND LOWER(name) LIKE LOWER(?)");
        }

        if (durationRange != null) {
            switch (durationRange) {
                case "<30":
                    sql.append(" AND durationminutes < 30");
                    break;
                case "30-60":
                    sql.append(" AND durationminutes BETWEEN 30 AND 60");
                    break;
                case ">60":
                    sql.append(" AND durationminutes > 60");
                    break;
            }
        }

        if (minPrice != null) {
            sql.append(" AND price >= ?");
        }

        if (maxPrice != null) {
            sql.append(" AND price <= ?");
        }

        if (categoryId != null) {
            sql.append(" AND categoryid = ?");
        }

        if (isActive != null) {
            sql.append(" AND isactive = ?");
        }

        sql.append(" ORDER BY id DESC OFFSET ? ROWS FETCH NEXT ? ROWS ONLY");

        try (PreparedStatement stmt = connection.prepareStatement(sql.toString())) {
            int paramIndex = 1;

            if (name != null && !name.trim().isEmpty()) {
                stmt.setString(paramIndex++, "%" + name.trim() + "%");
            }

            if (minPrice != null) {
                stmt.setDouble(paramIndex++, minPrice);
            }

            if (maxPrice != null) {
                stmt.setDouble(paramIndex++, maxPrice);
            }

            if (categoryId != null) {
                stmt.setInt(paramIndex++, categoryId);
            }

            if (isActive != null) {
                stmt.setBoolean(paramIndex++, isActive);
            }

            int offset = (page - 1) * pageSize;
            stmt.setInt(paramIndex++, offset);
            stmt.setInt(paramIndex, pageSize);

            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    SpaService service = new SpaService();
                    service.setId(rs.getInt("id"));
                    service.setName(rs.getString("name"));
                    service.setDescription(rs.getString("description"));
                    service.setDurationMinutes(rs.getInt("durationminutes"));
                    service.setPrice(rs.getBigDecimal("price"));
                    service.setActive(rs.getBoolean("isactive"));
                    service.setCategoryId(rs.getInt("categoryid"));
                    service.setImage(rs.getString("image"));

                    services.add(service);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return services;
    }

    public int countFilteredSpaServices(
            String name,
            String durationRange,
            Double minPrice,
            Double maxPrice,
            Integer categoryId,
            Boolean isActive
    ) {
        int totalItems = 0;
        StringBuilder sql = new StringBuilder("SELECT COUNT(*) FROM spaservice WHERE 1=1");

        if (name != null && !name.trim().isEmpty()) {
            sql.append(" AND LOWER(name) LIKE LOWER(?)");
        }

        if (durationRange != null) {
            switch (durationRange) {
                case "<30":
                    sql.append(" AND durationminutes < 30");
                    break;
                case "30-60":
                    sql.append(" AND durationminutes BETWEEN 30 AND 60");
                    break;
                case ">60":
                    sql.append(" AND durationminutes > 60");
                    break;
            }
        }

        if (minPrice != null) {
            sql.append(" AND price >= ?");
        }

        if (maxPrice != null) {
            sql.append(" AND price <= ?");
        }

        if (categoryId != null) {
            sql.append(" AND categoryid = ?");
        }

        if (isActive != null) {
            sql.append(" AND isactive = ?");
        }

        try (PreparedStatement stmt = connection.prepareStatement(sql.toString())) {
            int paramIndex = 1;

            if (name != null && !name.trim().isEmpty()) {
                stmt.setString(paramIndex++, "%" + name.trim() + "%");
            }

            if (minPrice != null) {
                stmt.setDouble(paramIndex++, minPrice);
            }

            if (maxPrice != null) {
                stmt.setDouble(paramIndex++, maxPrice);
            }

            if (categoryId != null) {
                stmt.setInt(paramIndex++, categoryId);
            }

            if (isActive != null) {
                stmt.setBoolean(paramIndex++, isActive);
            }

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    totalItems = rs.getInt(1);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return totalItems;
    }

    public void addSpaService(SpaService service) {
        String sql = "INSERT INTO spaservice (name, description, durationminutes, price, categoryid, image, isactive) VALUES (?, ?, ?, ?, ?, ?, ?)";

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, service.getName());
            stmt.setString(2, service.getDescription());
            stmt.setInt(3, service.getDurationMinutes());
            stmt.setBigDecimal(4, service.getPrice());
            stmt.setInt(5, service.getCategoryId());
            stmt.setString(6, service.getImage());
            stmt.setBoolean(7, service.isActive());

            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(); // Có thể thay bằng logging
        }
    }

    public void updateSpaService(SpaService service) {
        String sql = "UPDATE spaservice SET name = ?, description = ?, durationminutes = ?, price = ?, categoryid = ?, image = ?, isactive = ? WHERE id = ?";

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, service.getName());
            stmt.setString(2, service.getDescription());
            stmt.setInt(3, service.getDurationMinutes());
            stmt.setBigDecimal(4, service.getPrice());
            stmt.setInt(5, service.getCategoryId());
            stmt.setString(6, service.getImage());
            stmt.setBoolean(7, service.isActive());
            stmt.setInt(8, service.getId());

            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(); // Có thể thay bằng logging
        }
    }

    public SpaService getSpaServiceById(int id) {
        SpaService service = null;
        String sql = "SELECT * FROM spaservice WHERE id = ?";

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, id);

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    service = new SpaService();
                    service.setId(rs.getInt("id"));
                    service.setName(rs.getString("name"));
                    service.setDescription(rs.getString("description"));
                    service.setDurationMinutes(rs.getInt("durationminutes"));
                    service.setPrice(rs.getBigDecimal("price"));
                    service.setActive(rs.getBoolean("isactive"));
                    service.setCategoryId(rs.getInt("categoryid"));
                    service.setImage(rs.getString("image"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace(); // hoặc ghi log
        }

        return service;
    }

    public int getTotalActiveSpaServicePages() {
        String sql = "SELECT COUNT(*) FROM spaservice WHERE isactive = 1";

        try (PreparedStatement stmt = connection.prepareStatement(sql); ResultSet rs = stmt.executeQuery()) {

            if (rs.next()) {
                int count = rs.getInt(1);
                return (int) Math.ceil(count / 6.0);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return 0;
    }
}
