/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.estudiante.modelo;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author andres
 */
@Entity
@Table(name = "Estudiante")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Estudiante.findAll", query = "SELECT e FROM Estudiante e")
    , @NamedQuery(name = "Estudiante.findByCedula", query = "SELECT e FROM Estudiante e WHERE e.cedula = :cedula")
    , @NamedQuery(name = "Estudiante.findByPrimerNombre", query = "SELECT e FROM Estudiante e WHERE e.primerNombre = :primerNombre")
    , @NamedQuery(name = "Estudiante.findBySegundoNombre", query = "SELECT e FROM Estudiante e WHERE e.segundoNombre = :segundoNombre")
    , @NamedQuery(name = "Estudiante.findByPrimerApellido", query = "SELECT e FROM Estudiante e WHERE e.primerApellido = :primerApellido")
    , @NamedQuery(name = "Estudiante.findBySegundoApellido", query = "SELECT e FROM Estudiante e WHERE e.segundoApellido = :segundoApellido")
    , @NamedQuery(name = "Estudiante.findByCarrera", query = "SELECT e FROM Estudiante e WHERE e.carrera = :carrera")
    , @NamedQuery(name = "Estudiante.findByNombreImagen", query = "SELECT e FROM Estudiante e WHERE e.nombreImagen = :nombreImagen")
    , @NamedQuery(name = "Estudiante.findByPassword", query = "SELECT e FROM Estudiante e WHERE e.password = :password")})
public class Estudiante implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    //@NotNull
    //@Size(min = 1, max = 50)
    @Column(name = "Cedula",length=20, nullable= false)
    private String cedula;
    //@Size(max = 20)
    @Column(name = "Primer_Nombre",length=20)
    private String primerNombre;
   // @Size(max = 20)
    @Column(name = "Segundo_Nombre",length=20)
    private String segundoNombre;
    //@Size(max = 20)
    @Column(name = "Primer_Apellido",length=20)
    private String primerApellido;
    //@Size(max = 20)
    @Column(name = "Segundo_Apellido",length=20)
    private String segundoApellido;
    //@Size(max = 20)
    @Column(name = "Carrera",length=20)
    private String carrera;
    //@Size(max = 20)
    @Column(name = "Nombre_Imagen",length=20)
    private String nombreImagen;
    //@Size(max = 20)
    @Column(name = "Password",length=20)
    private String password;

    public Estudiante() {
    }

    public Estudiante(String cedula) {
        this.cedula = cedula;
    }

    public String getCedula() {
        return cedula;
    }

    public void setCedula(String cedula) {
        this.cedula = cedula;
    }

    public String getPrimerNombre() {
        return primerNombre;
    }

    public void setPrimerNombre(String primerNombre) {
        this.primerNombre = primerNombre;
    }

    public String getSegundoNombre() {
        return segundoNombre;
    }

    public void setSegundoNombre(String segundoNombre) {
        this.segundoNombre = segundoNombre;
    }

    public String getPrimerApellido() {
        return primerApellido;
    }

    public void setPrimerApellido(String primerApellido) {
        this.primerApellido = primerApellido;
    }

    public String getSegundoApellido() {
        return segundoApellido;
    }

    public void setSegundoApellido(String segundoApellido) {
        this.segundoApellido = segundoApellido;
    }

    public String getCarrera() {
        return carrera;
    }

    public void setCarrera(String carrera) {
        this.carrera = carrera;
    }

    public String getNombreImagen() {
        return nombreImagen;
    }

    public void setNombreImagen(String nombreImagen) {
        this.nombreImagen = nombreImagen;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (cedula != null ? cedula.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Estudiante)) {
            return false;
        }
        Estudiante other = (Estudiante) object;
        if ((this.cedula == null && other.cedula != null) || (this.cedula != null && !this.cedula.equals(other.cedula))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.estudiante.modelo.Estudiante[ cedula=" + cedula + " ]";
    }
    
}
