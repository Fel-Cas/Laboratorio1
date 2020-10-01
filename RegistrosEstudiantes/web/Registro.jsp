<%-- 
    Document   : Registro
    Created on : 1/10/2020, 09:09:00 AM
    Author     : andres
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro</title>
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
                border:2px black solid;
                background:#91E6F2;
            }
            tr,th{
                border:2px solid blak;
            }
        </style>
    </head>
    <body>
        <h1>Registrate</h1>
        <div align="center">
                <form action="EstudiantesServlet?action=registro" method="post">
                    <table>
                        <tr>
                            <th><label><b>Cedula:</b></label></th>
                            <th>
                                <input type="number" placeholder="Entre Cedula" class="form-control" name="cedula" required=""/>
                            </th>
                        </tr>
                        <tr>
                            <th><label><b>Primer Nombre:</b></label></th>
                            <th>
                                <input type="text" placeholder="Entre Primer Nombre" class="form-control" name="primer_nombre" required=""/>
                            </th>
                        </tr>
                        <tr>
                            <th><label><b>Segundo Nombre:</b></label></th>
                            <th>
                                <input type="text" placeholder="Entre Segundo Nombre" class="form-control" name="segundo_nombre" required=""/>
                            </th>
                        </tr>
                        <tr>
                            <th><label><b>Primer Apellido</b></label></th>
                            <th>
                                <input type="text" placeholder="Entre Primer Apelldio" class="form-control" name="primer_apelldio" required=""/>
                            </th>
                        </tr>
                        <tr>
                            <th><label><b>Segundo Apellido:</b></label></th>
                            <th>
                                <input type="text" placeholder="Entre Segundo Apellido" class="form-control" name="segundo_apellido" required=""/>
                            </th>
                        </tr>
                        <tr>
                            <th><label><b>Carrera:</b></label></th>
                            <th>
                                <input type="text" placeholder="Entre Carrera" class="form-control" name="carrera" required=""/>
                            </th>
                        </tr>
                        <tr>
                            <th><label><b>Nombre Imagen</b></label></th>
                            <th>
                                <input type="text" placeholder="Entre  Nombre Imagen" class="form-control" name="nombre_imagen" required=""/>
                            </th>
                        </tr>
                        <tr>
                            <th><label><b>Password:</b></label></th>
                            <th>
                                <input type="password" placeholder="Entre Password" class="form-control" name="password" required=""/>
                            </th>
                        </tr>
                        <div class="break"></div>
                        </div>
                        <tr>
                            <td colspan="2">
                                <input class="btn icon-btn btn-success" type="submit" name="action" value="Registrar">
                                
                            </td>
                        </tr>
                    </table>    
                </form> 
            </div>
    </body>
</html>
