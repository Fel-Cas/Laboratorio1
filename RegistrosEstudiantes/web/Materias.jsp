<%-- 
    Document   : Materias
    Created on : 1/10/2020, 11:44:12 AM
    Author     : andres
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Materias</title>
        <style>
            table{
                padding:1.3%;
                font-family:"Bradley Hand", cursive Arial;
                font-size:126%;
                border-spacing:1.2%;
                text-aling:center;
                border-collapse: collapse;
                position: relative;
                left:35%;

              }
            caption{
                font-size:200%;
                color:black;
                font-weight:800;
                font-style:oblique;
                background:#A6EE7A;
              }
            table, td, th {
                border: 2px solid black;
              }
            thead tr{
                background:#C4F0A9;
              }
              form,h1{
                  text-align: center;
              }
           

        </style>
    </head>
    <body>
        <h1>Registrar Materias</h1>
        <div>
           <form action="EstudiantesServlet?action=registroMaterias" method="post">
            <table>
              <thead>
                <caption>
                  Oferta de Materias
                </caption>
                <tr>
                  <th>Selección</th>
                  <th>Materia</th>
                  <th>Creditos</th>
                  <th>Código</th>
                <tr>
              </thead>
              <tbody>
                <tr>
                  <td><input type="checkBox" id="discretas" name="materia" value="2508111"></td>
                  <td><label for="discretas">Matemáticas Discretas I</label></td>
                  <td> 4</td>
                  <td>2508111</td>
                </tr>
                <tr>
                    <td><input type="checkBox" id="intro" name="materia" value="2508102"></td>
                  <td><label for="intro">Intro a la Ing de Sistema</label></td>
                  <td>2</td>
                  <td>2508102</td>
                </tr>
                <tr>
                  <td><input type="checkBox" id="logica" name="materia" value="2508107"></td>
                  <td><label for="logica">Logica y Representación I</label></td>
                  <td> 4</td>
                  <td>2508107</td>
                </tr>
              </tbody>
            </table>
               <br>
               <label> Cedula Estudiante</label>
               <input type="number"name="cedula" required="">
               <br>
               <br>
               <input type="submit" value="Registrar Materias">
            </form>
        </div>
    
    </body>
</html>
