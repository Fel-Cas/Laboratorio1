<%-- 
    Document   : Sesion.jsp
    Created on : 5/10/2020, 10:23:20 AM
    Author     : andres
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sesion</title>
        <style>
            h1{
                text-align: center;
                color:#456;
                font-style: oblique;
                font-size: 180%;
                font-weight: 700;
            }
            div{
                text-align: center;
                font-size: 145%;
            }
            table{
                position:relative;
                left:34%;
                border: 2px #14612c solid;
                border-radius: 10px;
                background: #aad8b3;
                font-size: 120%;
            }
            tr,th{
                border:2px solid blak;
            }
            h1,h2{
                text-align: center;
                font-size: 200%;
                color:#456;
            }
            .contenido{
                align:center;
            }
            section{
                display: block;
                text-align: center;
                font-size: 80%;
                border: solid 2px black;
                border-radius: 23px 23px;
                width: 50%;
                margin-right: auto;
                background:#EAFFD2 ;
                position:relative;
                left: 25%;
            }
            .boton{
                text-decoration: none;
                padding: 10px;
                font-weight: 600;
                font-size: 20px;
                color: #ffffff;
                background-color: #14612c;
                border-radius: 6px;
                border: 2px solid #0016b0;
              }
        </style>
    </head>
    <body>
       
        <c:if test="${not empty usuario}">
             <h1>Bienvenido ${usuario.primerNombre} ${usuario.segundoNombre} </h1>
            <div align="center">
                <form action="LoginServlet?action=actualizar" method="post" onsubmit="return validacion()" >
                    <table>
                        <tr>
                            <th><label><b>Cedula:</b></label></th>
                            <th>
                                <input type="number" placeholder="Entre Cedula" class="form-control" name="cedula" id="cedula" required="" disabled="" value="${usuario.cedula}"/>
                            </th>
                        </tr>
                        <tr>
                            <th><label><b>Primer Nombre:</b></label></th>
                            <th>
                                <input type="text" placeholder="Entre Primer Nombre" class="form-control" name="primer_nombre" id="primer_nombre" required="" value="${usuario.primerNombre}"/>
                            </th>
                        </tr>
                        <tr>
                            <th><label><b>Segundo Nombre:</b></label></th>
                            <th>
                                <input type="text" placeholder="Entre Segundo Nombre" class="form-control" name="segundo_nombre" id="segundo_nombre" required="" value="${usuario.segundoNombre}"/>
                            </th>
                        </tr>
                        <tr>
                            <th><label><b>Primer Apellido</b></label></th>
                            <th>
                                <input type="text" placeholder="Entre Primer Apelldio" class="form-control" name="primer_apellido" id="primer_apellido" required="" value="${usuario.primerApellido}"/>
                            </th>
                        </tr>
                        <tr>
                            <th><label><b>Segundo Apellido:</b></label></th>
                            <th>
                                <input type="text" placeholder="Entre Segundo Apellido" class="form-control" name="segundo_apellido" id="segundo_apellido" required="" value="${usuario.segundoApellido}"/>
                            </th>
                        </tr>
                        <tr>
                            <th><label><b>Carrera:</b></label></th>
                            <th>
                                <input type="text" placeholder="Entre Carrera" class="form-control" name="carrera" id="carrera" required="" value="${usuario.carrera}"/>
                            </th>
                        </tr>
                        <tr>
                            <th><label><b>Password:</b></label></th>
                            <th>
                                <input type="password" placeholder="Entre Password" class="form-control" name="password" id="password" required="" value="${usuario.password}"/>
                            </th>
                        </tr>
                        <div class="break"></div>
                        </div>
                        <tr>
                            <td colspan="2">
                                <input class="btn icon-btn btn-success" type="submit" name="action" value="Actualizar Datos">
                                
                            </td>
                        </tr>
                    </table>    
                </form>
        </c:if>
        <c:if test="${not empty mensaje}">
            <p>${mensaje}</p>
         </c:if>
        <c:if test="${not empty materias}">
            <h2>Materias Seleccionadas</h2>
            <div class="contenido">
                <section>
                <c:forEach var="a" items="${materias}">
                    <p><span>Nombre:</span>${a.nombre}</p>
                    <p><span>Codigo:</span> ${a.codigo}</p>
                    <p><span>Creditos:</span> ${a.creditos}</p>
                    <a onclick="return confirm('¿Está Seguro?')" href="LoginServlet?action=delete&id=${a.id}">Eliminar</a>
                </c:forEach>
                </section>
            </div>
        </c:if>
            <br>
        <a class="boton" onclick="return confirm('¿Está Seguro?')" href="LoginServlet?action=eliminar">Eliminar Cuenta</a>
        <br>
        <br>
        <a class="boton" onclick="return confirm('¿Está Seguro?')" href="LoginServlet?action=logout">Salir</a>
    </body>
</html>
