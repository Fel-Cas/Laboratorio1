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
import java.util.ArrayList;
import java.util.List;
import javax.ejb.EJB;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.TypedQuery;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author andres
 */
@WebServlet(name = "RegistroServlet", urlPatterns = {"/RegistroServlet"})
public class RegistroServlet extends HttpServlet {

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
         String mensaje=null;
        try {
            
            String action = request.getParameter("action");
            String url = "Registro.jsp";
           if("registroMaterias".equals(action)){
                String cedula=request.getParameter("cedula");
                Estudiante est= estudianteFacade.find(cedula);
                if(est==null){
                    mensaje="El usuario no existe";
                    url="Materias.jsp";
                }else{
                    EntityManagerFactory emf = Persistence.createEntityManagerFactory("RegistrosEstudiantesPU");
                    EntityManager em = emf.createEntityManager();
                    TypedQuery<Materia> query =em.createQuery("SELECT m FROM Materia m WHERE m.cedulaEstudiante='"+cedula+"'", Materia.class);
                    List<Materia> lista = query.getResultList();
                   String[] materias = request.getParameterValues("materia");
                   if(lista.size()==materias.length){
                        mensaje="El estudiante ya tiene matriculadas todas las materias";
                        url="Materias.jsp";
                   }else{
                        ArrayList<String>codigos=new ArrayList<>();
                        codigos.add("2508111");
                        codigos.add("2508102");
                        codigos.add("2508107");
                        ArrayList<String>nom=new ArrayList<>();
                        nom.add("Matemáticas Discretas I");
                        nom.add("Intro a la Ing de Sistema");
                        nom.add("Logica y Representación I");
                        for(int i=0;i<lista.size();i++){
                            Materia aux=lista.get(i);
                            for(int k=0;k<codigos.size();k++){
                                if(codigos.get(k).equals(aux.getCodigo())){
                                    nom.remove(k);
                                    codigos.remove(k);
                                }
                            }
                        }
                        if(codigos.size()!=0){
                            for(int j=0;j<materias.length;j++){
                                String aux=materias[j];
                                for(int i=0;i<codigos.size();i++){
                                    if(aux.equals(codigos.get(i))){
                                        Materia a=new Materia();
                                        a.setCedulaEstudiante(cedula);
                                        a.setCodigo(codigos.get(i));
                                        a.setCreditos("4");
                                        a.setNombre(nom.get(i));
                                        materiaFacade.create(a);
                                    }                                    
                                }
                            }
                            url="Busqueda.jsp";
                        }else{
                            mensaje="El estudiante ya tiene matriculadas esas materias";
                            url="Materias.jsp";
                        }                       
                        
                    }                   
                }
                
                
            }
            request.getSession().setAttribute("mensaje",mensaje);
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
