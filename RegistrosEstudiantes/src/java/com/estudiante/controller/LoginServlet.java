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
@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

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
        Estudiante estu=null;
         List<Materia>materias=null;
        try {
            String action = request.getParameter("action");
            String url = "Login.jsp";
            if ("login".equals(action)) {
               String u = request.getParameter("cedula");
                String p = request.getParameter("password");
                estu=estudianteFacade.find(u);
                
                if (estu!=null && estu.getPassword().equals(p)){
                    
                    EntityManagerFactory emf = Persistence.createEntityManagerFactory("RegistrosEstudiantesPU");
                    EntityManager em = emf.createEntityManager();
                    TypedQuery<Materia> query =em.createQuery("SELECT m FROM Materia m WHERE m.cedulaEstudiante='"+u+"'", Materia.class);
                    materias = query.getResultList();
                    url = "Sesion.jsp";
                    request.getSession().setAttribute("materias",materias);
                    request.getSession().setAttribute("usuario",estu);
                } else {
                    mensaje="Erro,contraseña o usuario incorrectos";
                    url="Login.jsp";
                }
                            
            }else if("delete".equals(action)) {
                String id = request.getParameter("id");
                Materia a = materiaFacade.find(Integer.valueOf(id));
                materiaFacade.remove(a);
                EntityManagerFactory emf = Persistence.createEntityManagerFactory("RegistrosEstudiantesPU");
                EntityManager em = emf.createEntityManager();
                estu=(Estudiante) request.getSession().getAttribute("usuario");
                TypedQuery<Materia> query =em.createQuery("SELECT m FROM Materia m WHERE m.cedulaEstudiante='"+estu.getCedula()+"'", Materia.class);
                materias = query.getResultList();
                request.getSession().setAttribute("materias",materias);
                url="Sesion.jsp";
                
            }else if("actualizar".equals(action)){
                estu=(Estudiante) request.getSession().getAttribute("usuario");
               Estudiante a=new Estudiante();
               a.setCedula(estu.getCedula());
               a.setPrimerNombre(request.getParameter("primer_nombre"));
               a.setSegundoNombre(request.getParameter("segundo_nombre"));
               a.setPrimerApellido(request.getParameter("primer_apellido"));
               a.setSegundoApellido(request.getParameter("segundo_apellido"));
               a.setCarrera(request.getParameter("carrera"));
               a.setNombreImagen(estu.getNombreImagen());
               a.setPassword(request.getParameter("password"));
               estudianteFacade.remove(estu);
               estudianteFacade.create(a);
               estu=estudianteFacade.find(a.getCedula());
               request.getSession().setAttribute("usuario",estu);
               url="Sesion.jsp";
            }else if("eliminar".equals(action)){
                estu=(Estudiante) request.getSession().getAttribute("usuario");
                EntityManagerFactory emf = Persistence.createEntityManagerFactory("RegistrosEstudiantesPU");
                EntityManager em = emf.createEntityManager();
                TypedQuery<Materia> query =em.createQuery("SELECT m FROM Materia m WHERE m.cedulaEstudiante='"+estu.getCedula()+"'", Materia.class);
                materias = query.getResultList();
                estudianteFacade.remove(estu);
                for(int i=0;i<materias.size();i++){
                    Materia a=materias.get(i);
                    materiaFacade.remove(a);
                }
                request.getSession().removeAttribute("usuario");
                request.getSession().removeAttribute("materias");
                url="index.jsp";
                
            }else if("logout".equals(action)){
                request.getSession().removeAttribute("usuario");
                request.getSession().removeAttribute("materias");
                url="Login.jsp";
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
