<%-- 
    Document   : inscribirse
    Created on : 1 jul 2024, 08:21:56
    Author     : metal
--%>

<!DOCTYPE html>
<html>
<head>
    <title>Inscripción</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f0f0f0;
        }
        .container {
            width: 80%;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            text-align: center;
        }
        .btn {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #0066cc;
            color: #fff;
            text-decoration: none;
            border-radius: 5px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Inscripción</h1>
        <%
            String titulo = request.getParameter("titulo");
            if (titulo != null && !titulo.isEmpty()) {
        %>
            <p>Te has inscrito exitosamente en el curso: <strong><%= titulo %></strong></p>
            <a href="index.jsp" class="btn">Volver a la lista de eventos</a>
        <%
            } else {
                out.println("<p>Error: No se especificó el curso.</p>");
            }
        %>
    </div>
</body>
</html>

