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
public class SpaServiceDAO extends DBContext{
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
    try (PreparedStatement statement = connection.prepareStatement(sql);
             ResultSet rs = statement.executeQuery()) {

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
}
