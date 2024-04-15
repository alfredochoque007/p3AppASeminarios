<%@ page import="com.modelo.Inscripcion" %>
<%
  Inscripcion req = (Inscripcion) request.getAttribute("inscripcionSession");
%>   


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Form</title>
    </head>
    <body>

        <h1>Registro de Seminarios</h1>

        <form action="SeminarioServlet" method="post">
            <div style="border: 1px solid #000">
                <div>
                    <input type="number" name="id" value="<%= req.getId() %>"/>
                </div>
                <div>
                    <label>Fecha:</label>
                    <input type="date" name="fecha" 
                           value="<%= req.getFecha() != null ? req.getFecha(): ""%>"
                           >
                </div>
                <div>
                    <label>Nombre: </label>
                    <input type="text" name="nombre" 
                           value="<%= req.getNombre() != null ? req.getNombre(): "" %>"
                           >
                </div>
                <div>
                    <label>Apellidos:</label>
                    <input type="text" name="apellidos" 
                           value="<%= req.getApellidos() != null ? req.getApellidos() : "" %>"
                           >
                </div>
                <div>
                    <label>Turno:</label>
                    <div>
                        <input type="radio" name="turno" value="Mañana" 
                               <%= (req.getTurno() != null && req.getTurno().equals("Mañana")) ? "checked" : "" %> 
                               >
                        <label>Mañana</label>
                    </div> 
                    <div>
                        <input type="radio" name="turno" value="Tarde" 
                               <%= (req.getTurno() != null && req.getTurno().equals("Tarde")) ? "checked" : "" %> 
                               >              
                        <label>Tarde</label>
                    </div> 
                    <div>
                        <input type="radio" name="turno" value="Noche" 
                               <%= (req.getTurno() != null && req.getTurno().equals("Noche")) ? "checked" : "" %> 
                               >                
                        <label>Noche</label>
                    </div>         
                </div>
            </div>

            <br>
            <div style="border: 1px solid #000">
                <div>
                    <input 
                        type="checkbox" name="seminario" value="Inteligencia Artificial" 
                        <%= (req.getSeminarios() != null && req.getSeminarios().contains("Inteligencia Artificial")) ? "checked" : "" %>
                        >
                    <label>Inteligencia Artificial</label>
                </div>
                <div>
                    <input type="checkbox" name="seminario" value="Machine Learning" 
                           <%= (req.getSeminarios() != null && req.getSeminarios().contains("Machine Learning")) ? "checked" : "" %>
                           >
                    <label>Machine Learning</label>
                </div>
                <div>
                    <input type="checkbox" name="seminario" value="Simulación con Arena" 
                           <%= (req.getSeminarios() != null && req.getSeminarios().contains("Simulación con Arena")) ? "checked" : "" %>
                           >
                    <label>Simulación con Arena</label>
                </div>
                <div>
                    <input type="checkbox" name="seminario" value="Robotica Educativa" 
                           <%= (req.getSeminarios() != null && req.getSeminarios().contains("Robotica Educativa")) ? "checked" : "" %>>
                    <label>Robotica Educativa</label>
                </div>
            </div>
            <br>
            <button type="submit">Enviar registro</button>
        </form>



    </body>
</html>
