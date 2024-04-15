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
    </head>
    <body>
        <h1>LISTADO DE INSCRITOS</h1>

        <a href="SeminarioServlet?op=nuevo" >Nuevo</a>

        <table border="1">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>FECHA</th>
                    <th>NOMBRE</th>
                    <th>APELLIDOS</th>
                    <th>TURNO</th>
                    <th>SEMINARIOS</th>
                    <th></th>
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
                        <%
                            for(String seminario: item.getSeminarios()){
                        %>
                        <%= seminario %>;
                        <%
                            }
                        %>  
                    </td>
                    <td><a href="SeminarioServlet?op=editar&id=<%= item.getId() %>">Editar</a></td>
                    <td><a href="SeminarioServlet?op=editar&id=<%= item.getId() %>">Eliminar</a></td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>

    </body>
</html>
