<%-- 
    Document   : newjsp
    Created on : 1 jul 2024, 07:51:22
    Author     : metal
--%>
<%@ page import="java.io.*, java.util.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="styles.css" />
    <title>Web Design Mastery | Learning Landing Page</title>
</head>
<body>
    <section class="container">
        <div class="content__container">
            <h1>
                Es hora de aprender y soñar<br />
                <span class="heading__1">con los eventos del </span><br />
                <span class="heading__2">SIMPOSIO </span>
            </h1>
            <p>
                Unlock your full learning potential with our intuitive education
                platform. Seamlessly blending technology and education, we provide an
                immersive learning environment that combines interactive lessons,
                virtual classrooms, and intelligent feedback.
            </p>
            <form>
                <input type="text" placeholder="¿Que evento buscas?" />
                <button type="submit">Buscar</button>
            </form>
        </div>
        <div class="image__container">
            <img src="3.png" alt="header" />
            <img src="ilustra1.png" alt="header" />
            <div class="image__content">
            </div>
        </div>
    </section>
    <div class="container">
        <h1>Lista de Eventos</h1>
        <%
            // Usa la ruta absoluta del archivo en tu sistema
            String filePath = "C:/Users/metal/OneDrive/Documentos/1.Polimorfismo/WebApplication9/src/java/az.txt";
            BufferedReader reader = null;
            try {
                File file = new File(filePath);
                if (file.exists() && file.canRead()) {
                    reader = new BufferedReader(new FileReader(file));
                    String line;
                    while ((line = reader.readLine()) != null) {
                        String[] eventDetails = line.split("\\|");
                        if (eventDetails.length == 4) {
                            String titulo = eventDetails[0];
                            String imagen = eventDetails[1];
                            String descripcion = eventDetails[2];
                            String expositor = eventDetails[3];
        %>
                            <div class="event">
                                <img src="<%= imagen %>" alt="<%= titulo %>">
                                <div class="event-details">
                                    <h2><a href="detalleEvento.jsp?titulo=<%= titulo %>"><%= titulo %></a></h2>
                                    <p><%= descripcion %></p>
                                    <p class="expositor">Expositor: <%= expositor %></p>
                                </div>
                            </div>
        <%
                        } else {
                            out.println("<p>Error: Formato incorrecto en el archivo.</p>");
                        }
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



