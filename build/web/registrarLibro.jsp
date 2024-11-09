
<%-- 
    Document   : registrarLibro
    Created on : 9/11/2024, 7:43:15 a. m.
    Author     : carlo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Registrar Libro</title>
</head>
<body>
    <h2>Formulario para Registrar Libro</h2>
    <form action="registrarLibro" method="post">.
        Isbn: <input type="text" name="isbn" required><br>
        Titulo: <input type="text" name="titulo_libro" required><br>
        Año: <input type="text" name="anio_publicacion" required><br>
        Autor: <input type="text" name="autor" required><br>
        Clasificacion: <input type="text" name="clasificacion" required><br>
        Paginas: <input type="text" name="cantidad_paginas" required><br>
        Tipo de Pasta: <input type="text" name="id_tipo_pasta" required><br>
        <input type="submit" value="Guardar">
    </form>
</body>
</html>
