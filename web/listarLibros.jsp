<%-- 
    Document   : listarLibro
    Created on : 9/11/2024, 8:45:47 a. m.
    Author     : carlo
--%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Lista de Libros</title>
</head>
<body>
    <h2>Lista de Libros</h2>
    <table border="1">
        <tr>
            <th>ISBN</th>
            <th>Título</th>
            <th>Año</th>
            <th>Autor</th>
            <th>Clasificación</th>
            <th>Detalles</th>
        </tr>
        <%
            java.sql.Connection conn = DatabaseConnection.getConnection();
            String sql = "SELECT * FROM libro";
            java.sql.PreparedStatement stmt = conn.prepareStatement(sql);
            java.sql.ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
        %>
        <tr>
            <td><%= rs.getString("isbn") %></td>
            <td><%= rs.getString("titulo_libro") %></td>
            <td><%= rs.getString("anio_publicacion") %></td>
            <td><%= rs.getString("autor") %></td>
            <td><%= rs.getString("clasificacion") %></td>
            <td><a href="verLibro?id=<%= rs.getString("isbn") %>">Ver detalles</a></td>
        </tr>
        <% 
            }
            conn.close();
        %>
    </table>
</body>
</html>
