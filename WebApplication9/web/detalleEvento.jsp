<%-- 
    Document   : detalleEvento
    Created on : 1 jul 2024, 08:20:40
    Author     : metal
--%>

<%@ page import="java.io.*, java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Detalles del Evento</title>
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
        }
        .event-details {
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        .event-details img {
            width: 200px;
            height: 200px;
            object-fit: cover;
            margin-bottom: 20px;
        }
        .event-details h2 {
            margin: 0;
            font-size: 24px;
        }
        .event-details p {
            margin: 10px 0;
            color: #555;
        }
        .event-details .expositor {
            font-weight: bold;
            color: #333;
        }
        .event-details .btn {
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
        <%
            String titulo = request.getParameter("titulo");
            String filePath = "C:/Users/metal/OneDrive/Documentos/1.Polimorfismo/WebApplication9/src/java/az.txt";
            BufferedReader reader = null;
            boolean found = false;
            try {
                File file = new File(filePath);
                if (file.exists() && file.canRead()) {
                    reader = new BufferedReader(new FileReader(file));
                    String line;
                    while ((line = reader.readLine()) != null) {
                        String[] eventDetails = line.split("\\|");
                        if (eventDetails.length == 4 && eventDetails[0].equals(titulo)) {
                            String imagen = eventDetails[1];
                            String descripcion = eventDetails[2];
                            String expositor = eventDetails[3];
                            found = true;
        %>
                            <div class="event-details">
                                <img src="<%= imagen %>" alt="<%= titulo %>">
                                <h2><%= titulo %></h2>
                                <p><%= descripcion %></p>
                                <p class="expositor">Expositor: <%= expositor %></p>
                                <a href="inscribirse.jsp?titulo=<%= titulo %>" class="btn">Inscribirse</a>
                            </div>
        <%
                            break;
                        }
                    }
                    if (!found) {
                        out.println("<p>Error: Evento no encontrado.</p>");
                    }
                } else {
                    out.println("<p>Error: El archivo no existe o no se puede leer.</p>");
                }
            } catch (FileNotFoundException e) {
                e.printStackTrace();
                out.println("<p>Error: Archivo no encontrado.</p>");
            } catch (IOException e) {
                e.printStackTrace();
                out.println("<p>Error al leer el archivo.</p>");
            } catch (Exception e) {
                e.printStackTrace();
                out.println("<p>Error inesperado: " + e.getMessage() + "</p>");
            } finally {
                if (reader != null) {
                    try {
                        reader.close();
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                }
            }
        %>
    </div>
</body>
</html>

