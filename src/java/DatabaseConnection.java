/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {
    public static Connection getConnection() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");  // Carga el controlador JDBC de MySQL
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            throw new SQLException("No se encontró el controlador JDBC de MySQL.");
        }
        
        String url = "jdbc:mysql://localhost:3306/base_datos_final";
        String user = "root";
        String password = "";
        
        return DriverManager.getConnection(url, user, password);
    }
}
