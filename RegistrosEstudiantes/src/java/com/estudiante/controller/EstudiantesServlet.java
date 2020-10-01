/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.estudiante.controller;

import com.estudiante.ejb.EstudianteFacadeLocal;
import com.estudiante.ejb.MateriaFacadeLocal;
import com.estudiante.modelo.Estudiante;
import com.estudiante.modelo.Materia;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.Integer.parseInt;
import java.util.ArrayList;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author andres
 */
@WebServlet(name = "EstudiantesServlet", urlPatterns = {"/EstudiantesServlet"})
public class EstudiantesServlet extends HttpServlet {

    @EJB
    private MateriaFacadeLocal materiaFacade;

    @EJB
    private EstudianteFacadeLocal estudianteFacade;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            String action = request.getParameter("action");
            String url = "Registro.jsp";
            if ("registro".equals(action)) {
                Estudiante a = new Estudiante();
                a.setCedula(request.getParameter("cedula"));
                a.setPrimerNombre(request.getParameter("primer_nombre"));
                a.setSegundoNombre(request.getParameter("segundo_nombre"));
                a.setPrimerApellido(request.getParameter("primer_apellido"));
                a.setSegundoApellido(request.getParameter("segundo_apellido"));
                a.setCarrera(request.getParameter("carrera"));
                a.setNombreImagen(request.getParameter("nombre_imagen"));
                a.setPassword(request.getParameter("password"));
                estudianteFacade.create(a);
                url = "Materias.jsp";
            }else if("busqueda".equals(action)){
                String entrada=request.getParameter("entrada");
                System.out.println(entrada);
                 Estudiante a= estudianteFacade.find(entrada);
                 request.getSession().setAttribute("usuario",a);
                url="Busqueda.jsp";
            }else if("registroMaterias".equals(action)){
                String[] materias = request.getParameterValues("materia");
                String cedula=request.getParameter("cedula");
                String[] codigos=new String[]{"2508111","2508102","2508107"};
                String[] nom=new String[]{"Matemáticas Discretas I","Intro a la Ing de Sistema","Logica y Representación I"};
                for(int i=0;i<materias.length;i++){
                    String cod=materias[i];
                    for(int j=0;j<codigos.length;j++){
                        if(cod.equals(codigos[j])){
                            Materia a=new Materia();
                            a.setCedulaEstudiante(cedula);
                            a.setCodigo(cod);
                            a.setCreditos("4");
                            a.setNombre(nom[j]);
                           materiaFacade.create(a);
                        }
                    }
                }
                url="Busqueda.jsp";
            }
            response.sendRedirect(url);
        } finally {
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
