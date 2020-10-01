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
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
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
@Table(name = "Materia")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Materia.findAll", query = "SELECT m FROM Materia m")
    , @NamedQuery(name = "Materia.findById", query = "SELECT m FROM Materia m WHERE m.id = :id")
    , @NamedQuery(name = "Materia.findByCedulaEstudiante", query = "SELECT m FROM Materia m WHERE m.cedulaEstudiante = :cedulaEstudiante")
    , @NamedQuery(name = "Materia.findByNombre", query = "SELECT m FROM Materia m WHERE m.nombre = :nombre")
    , @NamedQuery(name = "Materia.findByCodigo", query = "SELECT m FROM Materia m WHERE m.codigo = :codigo")
    , @NamedQuery(name = "Materia.findByCreditos", query = "SELECT m FROM Materia m WHERE m.creditos = :creditos")})
public class Materia implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "ID")
    private Integer id;
    //@Size(max = 20)
    @Column(name = "Cedula_Estudiante",length=20)
    private String cedulaEstudiante;
    @Basic(optional = false)
    //@NotNull
    //@Size(min = 1, max = 50)
    @Column(name = "Nombre",length=50,nullable=false)
    private String nombre;
    @Basic(optional = false)
    //@NotNull
    //@Size(min = 1, max = 50)
    @Column(name = "Codigo",length=50,nullable=false)
    private String codigo;
    @Basic(optional = false)
    //@NotNull
    //@Size(min = 1, max = 50)
    @Column(name = "Creditos",length=50,nullable=false)
    private String creditos;

    public Materia() {
    }

    public Materia(Integer id) {
        this.id = id;
    }

    public Materia(Integer id, String nombre, String codigo, String creditos) {
        this.id = id;
        this.nombre = nombre;
        this.codigo = codigo;
        this.creditos = creditos;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCedulaEstudiante() {
        return cedulaEstudiante;
    }

    public void setCedulaEstudiante(String cedulaEstudiante) {
        this.cedulaEstudiante = cedulaEstudiante;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public String getCreditos() {
        return creditos;
    }

    public void setCreditos(String creditos) {
        this.creditos = creditos;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Materia)) {
            return false;
        }
        Materia other = (Materia) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.estudiante.modelo.Materia[ id=" + id + " ]";
    }
    
}
