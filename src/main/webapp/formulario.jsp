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
        <link rel="stylesheet" href="css/app.css"/>
    </head>
    <body>

        <h1>REGISTRO DE SEMINARIOS</h1>

        <form action="SeminarioServlet" method="post" >
            <div class="form-container">
                <div class="card card-registros">
                    <div>
                        <input type="number" name="id" value="<%= req.getId() %>"  style="display: none" />
                    </div>
                    
                    <h3>Datos de registro</h3>
                    <div>
                        <label class="form-label">Fecha:</label>
                        <input type="date" name="fecha" required class="form-control"
                               value="<%= req.getFecha() != null ? req.getFecha(): ""%>"
                               >
                    </div>
                    <div>
                        <label class="form-label">Nombre: </label>
                        <input type="text" name="nombre" required class="form-control"
                               value="<%= req.getNombre() != null ? req.getNombre(): "" %>"
                               >
                    </div>
                    <div>
                        <label class="form-label">Apellidos:</label>
                        <input type="text" name="apellidos" required class="form-control"
                               value="<%= req.getApellidos() != null ? req.getApellidos() : "" %>"
                               >
                    </div>
                    <div class="turno-container">
                        <label class="form-label">Turno:</label>
                        <div>
                            <input type="radio" name="turno" value="Mañana" required class="form-radio"
                                   <%= (req.getTurno() != null && req.getTurno().equals("Mañana")) ? "checked" : "" %> 
                                   >
                            <label>Mañana</label>
                        </div> 
                        <div>
                            <input type="radio" name="turno" value="Tarde" required class="form-radio"
                                   <%= (req.getTurno() != null && req.getTurno().equals("Tarde")) ? "checked" : "" %> 
                                   >              
                            <label>Tarde</label>
                        </div> 
                        <div>
                            <input type="radio" name="turno" value="Noche" required class="form-radio"
                                   <%= (req.getTurno() != null && req.getTurno().equals("Noche")) ? "checked" : "" %> 
                                   >                
                            <label>Noche</label>
                        </div>         
                    </div>
                </div>

                <div class="card card-seminarios">
                     <h3>Seminarios disponibles</h3>
                    <div>
                        <input 
                            type="checkbox" name="seminario" value="Inteligencia Artificial" class="form-checkbox"
                            <%= (req.getSeminarios() != null && req.getSeminarios().contains("Inteligencia Artificial")) ? "checked" : "" %>
                            >
                        <label>Inteligencia Artificial</label>
                    </div>
                    <div>
                        <input type="checkbox" name="seminario" value="Machine Learning" class="form-checkbox"
                               <%= (req.getSeminarios() != null && req.getSeminarios().contains("Machine Learning")) ? "checked" : "" %>
                               >
                        <label>Machine Learning</label>
                    </div>
                    <div>
                        <input type="checkbox" name="seminario" value="Simulación con Arena" class="form-checkbox"
                               <%= (req.getSeminarios() != null && req.getSeminarios().contains("Simulación con Arena")) ? "checked" : "" %>
                               >
                        <label>Simulación con Arena</label>
                    </div>
                    <div>
                        <input type="checkbox" name="seminario" value="Robotica Educativa" class="form-checkbox"
                               <%= (req.getSeminarios() != null && req.getSeminarios().contains("Robotica Educativa")) ? "checked" : "" %>>
                        <label>Robotica Educativa</label>
                    </div>
                </div>
            </div>

            <div class="form-acction">
                <button type="submit" class="btn btn-nuevo">Enviar registro</button>
            </div>
        </form>

        <!<!-- script para validar que este por lo menos un semeinario seleccionado -->            
        <!--<script src="js/app.js"></script>-->

    </body>
</html>
