package com.modelo;

import java.util.ArrayList;
/**
 *
 * @author l-alfredo
 */
public class Inscripcion {

    private int id;
    private String fecha;
    private String nombre;
    private String apellidos;
    private String turno;
    private ArrayList<String> Seminarios;

    public Inscripcion() {
    }

    public Inscripcion(int id, String fecha, String nombre, String Apellidos, String turno, ArrayList Seminarios) {
        this.id = id;
        this.fecha = fecha;
        this.nombre = nombre;
        this.apellidos = Apellidos;
        this.turno = turno;
        this.Seminarios = Seminarios;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String Apellidos) {
        this.apellidos = Apellidos;
    }

    public String getTurno() {
        return turno;
    }

    public void setTurno(String turno) {
        this.turno = turno;
    }

    public ArrayList<String> getSeminarios() {
        return Seminarios;
    }

    public void setSeminarios(ArrayList<String> Seminarios) {
        this.Seminarios = Seminarios;
    }

}
