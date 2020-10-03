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
            body{
            padding:1%;
            margin:33px;
            font-size:130%;

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
                font-size: 120%;
                border: solid 2px black;
                border-radius: 23px 23px;
                width: 50%;
                margin-right: auto;
                background:#EAFFD2 ;
                position:relative;
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
            display: block;
            text-decoration:none;
            color:#000;
            width:100%;
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
        <h1>Busca a un Estudiante</h1>
        <div align="center">
            <form action="EstudiantesServlet?action=busqueda" method="post" onsubmit="return validacion()">
                <table>
                    <tr>
                        <th><label><b>Ingrese numero de Cedula</b></label></th>
                            <th>
                                <input  type="number" placeholder="Entre Cedula" id="entradaCedula" class="form-control" name="entrada" required=""/>
                            </th>
                    </tr>
                    <tr>
                        <th>
                            <input type="submit" value="Buscar"> 
                        </th>
                        
                    </tr>
                   
                </table>
            </form>
            <p id="error"></p>
        </div>
         <c:if test="${not empty mensaje}">
                <p id="errorU">${mensaje}</p>            
        </c:if> 
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
             <c:if test="${not empty materias}">
            <h2>Materias Seleccionadas</h2>
            <div class="contenido">
                <section>
                <c:forEach var="a" items="${materias}">
                    <p><span>Nombre:</span>${a.nombre}</p>
                    <p><span>Codigo:</span> ${a.codigo}</p>
                    <p><span>Creditos:</span> ${a.creditos}</p>
                </c:forEach>
                </section>
            </div>
            
        </c:if>
            <script>
                
                function validacion(){
                    let entrada=document.getElementById("entradaCedula").value;
                    let validacion=true;
                    var salida="";
                    if(entrada.length>20){
                      salida="La longitud de la entrada debe ser menor a 20 caracteres."; 
                      validacion=false;                   
                  }
                  if(!validacion){
                      let doc=document.getElementById("error");
                      doc.textContent=salida;
                  }
                  
                  return validacion;
                }
            </script>
    </body>
</html>
