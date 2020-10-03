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
            body{
            padding:1%;
            margin:33px;
            font-size:130%;

          }
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
            #error,#errorU{
                  color:red;
                  font-size: 140%;
                  text-align: center;
            
            }
            nav{
            background:#42E72D;
            height:90px;
          }
          nav ul li{
            display:inline-block;
            width:20%;
            background:#f45;
            text-align:center;
            margin-right:4%;
            margin-top:3%;
            transition:padding 2s ease, opacity 2s linear;
            opacity:.7;
            background:#fff;
          }
          nav ul li:hover{
            padding:.5%;
            opacity:1;
          }
          a{  
            text-decoration:none;
            color:#000;
            width:100%;
            display: block;
          }
        </style>
    </head>
    <body>
        <nav>
            <ul>
              <li><a href="index.jsp">Home</a></li>
              <li><a href="Registro.jsp">Registrar</a></li>
              <li><a href="Busqueda.jsp">Buscar</a></li>
              <li><a href="Matricula.jsp">Matricular Materias</a></li>
            </ul>
        </nav>
        <h1>Registrate</h1>
        <div align="center">
                <form action="EstudiantesServlet?action=registro" method="post" onsubmit="return validacion()" >
                    <table>
                        <tr>
                            <th><label><b>Cedula:</b></label></th>
                            <th>
                                <input type="number" placeholder="Entre Cedula" class="form-control" name="cedula" id="cedula" required=""/>
                            </th>
                        </tr>
                        <tr>
                            <th><label><b>Primer Nombre:</b></label></th>
                            <th>
                                <input type="text" placeholder="Entre Primer Nombre" class="form-control" name="primer_nombre" id="primer_nombre" required=""/>
                            </th>
                        </tr>
                        <tr>
                            <th><label><b>Segundo Nombre:</b></label></th>
                            <th>
                                <input type="text" placeholder="Entre Segundo Nombre" class="form-control" name="segundo_nombre" id="segundo_nombre" required=""/>
                            </th>
                        </tr>
                        <tr>
                            <th><label><b>Primer Apellido</b></label></th>
                            <th>
                                <input type="text" placeholder="Entre Primer Apelldio" class="form-control" name="primer_apellido" id="primer_apellido" required=""/>
                            </th>
                        </tr>
                        <tr>
                            <th><label><b>Segundo Apellido:</b></label></th>
                            <th>
                                <input type="text" placeholder="Entre Segundo Apellido" class="form-control" name="segundo_apellido" id="segundo_apellido" required=""/>
                            </th>
                        </tr>
                        <tr>
                            <th><label><b>Carrera:</b></label></th>
                            <th>
                                <input type="text" placeholder="Entre Carrera" class="form-control" name="carrera" id="carrera" required=""/>
                            </th>
                        </tr>
                        <tr>
                            <th><label><b>Nombre Imagen</b></label></th>
                            <th>
                                <input type="text" placeholder="Entre  Nombre Imagen" class="form-control" name="nombre_imagen" id="nombre_imagen" required=""/>
                            </th>
                        </tr>
                        <tr>
                            <th><label><b>Password:</b></label></th>
                            <th>
                                <input type="password" placeholder="Entre Password" class="form-control" name="password" id="password" required=""/>
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
            <p id="error"></p>
            
            </div>
            <c:if test="${not empty mensaje}">
                <p id="errorU">${mensaje}</p>            
            </c:if>
            <script>
                //EstudiantesServlet?action=registro
                function validacion(){
                    let cedula=document.getElementById("cedula").value;
                    let primerNombre=document.getElementById("primer_nombre").value;
                    let segundoNombre=document.getElementById("segundo_nombre").value;
                    let primerApellido=document.getElementById("primer_apellido").value;
                    let segundoApellido=document.getElementById("segundo_apellido").value;
                    let nombreImagen=document.getElementById("nombre_imagen").value;
                    let carrera=document.getElementById("carrera").value;
                    let password=document.getElementById("password").value;
                    let validacion=true;
                    var salida="";
                    if(cedula.length>20){
                        salida+="La cedula debe tener maximo 20 caracteres"+"<br>";
                        validacion=false;
                    }
                    if(primerNombre.length>20){
                        salida+="El primer nombre debe tener maximo 20 caracteres"+"<br>";
                        validacion=false;
                    }
                    if(segundoNombre.length>20){
                        salida+="El segundo nombre debe tener maximo 20 caracteres"+"<br>";
                        validacion=false;
                    }
                    if(primerApellido.length>20){
                        salida+="El primer apellido debe tener maximo 20 caracteres"+"<br>";
                        validacion=false;
                    }
                    if(nombreImagen.length>20){
                        salida+="El nombre de la imagen debe tener maximo 20 caracteres"+"<br>";
                        validacion=false;
                    }
                    if(segundoApellido.length>20){
                        salida+="El segundo Apellido debe tener maximo 20 caracteres"+"<br>";
                        validacion=false;
                    }
                    if(carrera.length>20){
                        salida+="El nombre de la carrera debe tener maximo 20 caracteres"+"<br>";
                        validacion=false;
                    }
                    if(password.length>20){
                        salida+="La contraseña debe tener maximo 20 caracteres"+"<br>";
                        validacion=false;
                    }
                    if(!validacion){
                        let doc=document.getElementById("error");
                        doc.innerHTML=salida;
                    }
                   return validacion;
                    
                }
            </script>
    </body>
</html>
