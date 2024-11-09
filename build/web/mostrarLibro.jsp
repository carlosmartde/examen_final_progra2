<%-- 
    Document   : mostrarLibro
    Created on : 9/11/2024, 8:35:45 a. m.
    Author     : carlo
--%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Detalles del Libro</title>
</head>
<body>
    <h2>Detalles del Libro</h2>
    <%
        String isbn = request.getParameter("id");
        java.sql.Connection conn = DatabaseConnection.getConnection();
        String sql = "SELECT * FROM libro WHERE isbn = ?";
        java.sql.PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setString(1, isbn);
        java.sql.ResultSet rs = stmt.executeQuery();
        if (rs.next()) {
    %>
    <p><strong>ISBN:</strong> <%= rs.getString("isbn") %></p>
    <p><strong>Título:</strong> <%= rs.getString("titulo_libro") %></p>
    <p><strong>Año de Publicación:</strong> <%= rs.getString("anio_publicacion") %></p>
    <p><strong>Autor:</strong> <%= rs.getString("autor") %></p>
    <p><strong>Clasificación:</strong> <%= rs.getString("clasificacion") %></p>
    <p><strong>Páginas:</strong> <%= rs.getString("cantidad_paginas") %></p>
    <p><strong>Tipo de Pasta:</strong> <%= rs.getString("tipo_pasta_id_tipo_pasta") %></p>
    <% 
        } else { 
    %>
    <p>El libro no se encuentra en la base de datos.</p>
    <% 
        } 
        conn.close();
    %>
    <a href="listarLibro.jsp">Regresar a la lista de libros</a>
</body>
</html>
