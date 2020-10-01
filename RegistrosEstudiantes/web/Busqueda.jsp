<%-- 
    Document   : Busqueda
    Created on : 1/10/2020, 10:09:58 AM
    Author     : andres
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Busqueda</title>
        <style>
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
                font-size: 120%;
                border: solid 2px black;
                border-radius: 23px 23px;
                width: 50%;
                margin-right: auto;
                background:#EAFFD2 ;
                position:absolute;
                left: 25%;
            }
            p span{
                color:#000;
                font-family: monospace;
                font-style: cursive;
            }
            section img{
                width: 200px;
            }
            
        </style>
    </head>
    <body>
        <h1>Busca a un Estudiante</h1>
        <div align="center">
            <form action="EstudiantesServlet?action=busqueda" method="post">
                <table>
                    <tr>
                        <th><label><b>Ingrese numero de Cedula</b></label></th>
                            <th>
                                <input type="number" placeholder="Entre Cedula" class="form-control" name="entrada" required=""/>
                            </th>
                    </tr>
                    <tr>
                        <th>
                            <input type="submit" value="Buscar"> 
                        </th>
                        
                    </tr>
                   
                </table>
            </form>
        </div>
        <c:if test="${not empty usuario}">
            <h2>Datos Importantes</h2>
            <div class="contenido">
                <section>
                <p><span>Nombre:</span> ${usuario.primerNombre} ${usuario.segundoNombre} </p>
                <p><span>Apellido:</span> ${usuario.primerApellido} ${usuario.segundoApellido}</p>
                <p><span>Cedula:</span> ${usuario.cedula}</p>
                <img alt="" src="Img/${usuario.nombreImagen}">
                </section>
            </div>
            
        </c:if>
    </body>
</html>
