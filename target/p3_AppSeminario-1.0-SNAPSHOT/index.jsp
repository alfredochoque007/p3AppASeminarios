<%@ page import="java.util.ArrayList" %>
<%@ page import="com.modelo.Inscripcion" %>
<%
    if(session.getAttribute("listaInscripciones") == null) {
      ArrayList<Inscripcion> listAux = new ArrayList<Inscripcion>();
      session.setAttribute("listaInscripciones", listAux);
    }
  ArrayList<Inscripcion> lista = (ArrayList<Inscripcion>) session.getAttribute("listaInscripciones");
%>    
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/app.css"/>
    </head>
    <body>
        <h1>LISTADO DE INSCRITOS</h1>


        <div class="table-container">
            <div>
                <a href="SeminarioServlet?op=nuevo" class="btn btn-nuevo" >Nuevo</a>

                <table class="table">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>FECHA</th>
                            <th>NOMBRE</th>
                            <th>APELLIDOS</th>
                            <th>TURNO</th>
                            <th>SEMINARIOS</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            for(Inscripcion item: lista){
                        %>
                        <tr>
                            <td><%= item.getId() %></td>
                            <td><%= item.getFecha() %></td>
                            <td><%= item.getNombre() %></td>
                            <td><%= item.getApellidos() %></td>
                            <td><%= item.getTurno() %></td>
                            <td>
                                <ul>
                                    <%
                                        for(String seminario: item.getSeminarios()){
                                    %>
                                    <li> <%= seminario %></li>
                                        <%
                                            }
                                        %>  

                                </ul>


                            </td>
                            <td><a href="SeminarioServlet?op=editar&id=<%= item.getId() %>" class="btn btn-editar">Editar</a>

                                <a href="SeminarioServlet?op=eliminar&id=<%= item.getId() %>" class="btn btn-eliminar"
                                   onclick="return(confirm('Esta seguro que desea eliminar este registro??'))">
                                    Eliminar
                                </a>
                            </td>
                        </tr>
                        <%
                            }
                        %>
                    </tbody>
                </table>
            </div>

        </div>

    </body>
</html>
