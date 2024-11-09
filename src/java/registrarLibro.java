/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/registrarLibro")
public class registrarLibro extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String isbn = request.getParameter("isbn");
        String titulo = request.getParameter("titulo_libro");
        String anio = request.getParameter("anio_publicacion");
        String autor = request.getParameter("autor");
        String clasificacion = request.getParameter("clasificacion");
        String paginas = request.getParameter("cantidad_paginas");
        String pasta = request.getParameter("id_tipo_pasta");

        try (Connection conn = DatabaseConnection.getConnection()) {
            String sql = "INSERT INTO libro (isbn,titulo_libro, anio_publicacion, autor, clasificacion, cantidad_paginas, tipo_pasta_id_tipo_pasta) VALUES (?,?,?,?,?,?,?)";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, isbn);
            statement.setString(2, titulo);
            statement.setString(3, anio);
            statement.setString(4, autor);
            statement.setString(5, clasificacion);
            statement.setString(6, paginas);
            statement.setString(7, pasta);
            statement.executeUpdate();
            response.getWriter().println("Libro ingresado correctamente.");
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().println("Error al ingresar el libro."+e);
        }
    }
}
