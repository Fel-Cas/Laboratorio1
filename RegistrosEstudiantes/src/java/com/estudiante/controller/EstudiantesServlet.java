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
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.Integer.parseInt;
import java.util.ArrayList;
import java.util.List;
import javax.ejb.EJB;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;
import javax.persistence.TypedQuery;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

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

    private static final long serialVersionUID = 1L;
    private final String UPLOAD_DIRECTORY = "Img";

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
        String mensaje = null;
        try {
            String action = request.getParameter("action");
            String url = "Registro.jsp";
            if ("registro".equals(action)) {
                String cedula = null;
                String primerNombre = null;
                String segundoNombre = null;
                String primerApellido = null;
                String segundoApellido = null;
                String carrera = null;
                String password = null;
                String nombreImagen = null;

                if (ServletFileUpload.isMultipartContent(request)) {
                    try {
                        String fname = null;
                        String fsize = null;
                        String ftype = null;

                        int cont = 0;
                        List<FileItem> multiparts = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
                        for (FileItem item : multiparts) {
                            cont += 1;
                            if (!item.isFormField()) {
                                fname = new File(item.getName()).getName();
                                fsize = new Long(item.getSize()).toString();
                                ftype = item.getContentType();
                                item.write(new File(UPLOAD_DIRECTORY + File.separator + fname));
                                nombreImagen = fname;
                            } else {
                                if (cont == 1) {
                                    cedula = item.getString();
                                } else if (cont == 2) {
                                    primerNombre = item.getString();
                                } else if (cont == 3) {
                                    segundoNombre = item.getString();
                                } else if (cont == 4) {
                                    primerApellido = item.getString();
                                } else if (cont == 5) {
                                    segundoApellido = item.getString();
                                } else if (cont == 6) {
                                    carrera = item.getString();
                                } else if (cont == 7) {
                                    password = item.getString();
                                }
                            }
                        }
                        //File uploaded successfully
                    } catch (Exception ex) {
                        request.setAttribute("message", "File Upload Failed due to " + ex);
                    }

                }
                Estudiante a = new Estudiante();
                a = estudianteFacade.find(cedula);
                if (a != null) {
                    mensaje = "El estudiante ya existe";
                    url = "Registro.jsp";
                } else {
                    a.setCedula(cedula);
                    a.setPrimerNombre(primerNombre);
                    a.setSegundoNombre(segundoNombre);
                    a.setPrimerApellido(primerApellido);
                    a.setSegundoApellido(segundoApellido);
                    a.setCarrera(carrera);
                    a.setNombreImagen(nombreImagen);
                    a.setPassword(password);
                    estudianteFacade.create(a);
                    url = "Materias.jsp";
                }

                
            }

            request.getSession().setAttribute("mensaje", mensaje);
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
