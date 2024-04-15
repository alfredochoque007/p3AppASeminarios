package com.controlador;

import com.modelo.Inscripcion;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;

/**
 *
 * @author l-alfredo
 */
public class SeminarioServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String op = request.getParameter("op");
        HttpSession ses = request.getSession();
        ArrayList<Inscripcion> lista = (ArrayList<Inscripcion>) ses.getAttribute("listaInscripciones");

        switch (op) {
            case "nuevo":
                request.setAttribute("inscripcionSession", new Inscripcion());
                request.getRequestDispatcher("formulario.jsp").forward(request, response);
                break;
            case "editar":
                int id = Integer.parseInt(request.getParameter("id"));
                int indice = obtenerIndice(request, id);
                Inscripcion inscripcion = lista.get(indice);
                request.setAttribute("inscripcionSession", inscripcion);
                request.getRequestDispatcher("formulario.jsp").forward(request, response);
                break;
            case "eliminar":
                //int id = Integer.parseInt(request.getParameter("id"));
                //int indice = obtenerIndice(request, id);
//                if (pos >= 0) {
//                    lista.remove(pos);
//                }
//                request.setAttribute("listacal", lista);
//                response.sendRedirect("index.jsp");
                break;
            default:
                throw new AssertionError();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession sesion = request.getSession();
        ArrayList<Inscripcion> listaInscripciones = (ArrayList<Inscripcion>) sesion.getAttribute("listaInscripciones");

        //recupera los datos de la Inscripcion
        int id = Integer.parseInt(request.getParameter("id"));
        String fecha = request.getParameter("fecha");
        String nombre = request.getParameter("nombre");
        String apellidos = request.getParameter("apellidos");
        String turno = request.getParameter("turno");
        String[] seminarios = request.getParameterValues("seminario");
        ArrayList<String> listSeminarios = new ArrayList<String>();
        for (String seminario : seminarios) {
            listSeminarios.add(seminario);
        }

        //Construye el Objeto con los datos
        Inscripcion inscripcion = new Inscripcion();
        inscripcion.setFecha(fecha);
        inscripcion.setNombre(nombre);
        inscripcion.setApellidos(apellidos);
        inscripcion.setTurno(turno);
        inscripcion.setSeminarios(listSeminarios);

        if (id != 0) { //edita
            inscripcion.setId(id);
            int indice = obtenerIndice(request, id);// devuelve el indice de ubicacion del objeto dentro de arrayList
            System.out.println("id editar:  " + indice);
            listaInscripciones.set(indice, inscripcion); // actualiza la informacion dentro arrayList
        } else { //crear
            inscripcion.setId(obtenerId(request));
            listaInscripciones.add(inscripcion);
            System.out.println("id crear:  " + inscripcion.getId());
        }
        request.setAttribute("listaInscripciones", listaInscripciones);
        response.sendRedirect("index.jsp");
    }

    public int obtenerIndice(HttpServletRequest request, int id) {
        HttpSession ses = request.getSession();
        ArrayList<Inscripcion> lista = (ArrayList<Inscripcion>) ses.getAttribute("listaInscripciones");

        int indice = -1;
        if (lista != null) {
            for (Inscripcion ele : lista) {
                ++indice;
                if (ele.getId() == id) {
                    break;
                }
            }
        }
        return indice;
    }

    public int obtenerId(HttpServletRequest request) {
        HttpSession ses = request.getSession();
        ArrayList<Inscripcion> lista = (ArrayList<Inscripcion>) ses.getAttribute("listaInscripciones");
        int id = 0;
        for (Inscripcion inscripcion : lista) {
            id = inscripcion.getId();
        }
        return id + 1;
    }
}
