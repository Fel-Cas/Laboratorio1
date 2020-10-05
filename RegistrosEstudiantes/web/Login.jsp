<%-- 
    Document   : Login
    Created on : 5/10/2020, 09:40:05 AM
    Author     : andres
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <style>
            body{
            padding:1%;
            margin:33px;
            font-size:130%;

          }
          h1{
            text-align:center;
            font-weight:900;
            font-style:oblique;
            color:#2B891F;
          }
            div{
                justify-content: center;
                align-items: center;
              }
              .hijo{
                border:solid 2px;
                width:350px;
                text-align:center;
                margin-right:auto;
                position:relative;
                left:38%;
                padding:2%;
                border-radius:10px;
              }
              .hijo input {
                margin:2%;
               }
              .hijo label{
                display:block;
                position:relative;
                left:-31%;
                font-size:123%;
                font-style:oblique;
              }
              .hijo input{
                width:80%;
                height: 30px;
              }
              #pass{
                background:#ffffff;
              }
              nav{
            background:#14612c;
            height:90px;
          }
          nav ul li{
            display:inline-block;
            width:15%;
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
         #error,#errorU{
                  color:red;
                  font-size: 140%;
                  text-align: center;
            
            }
        </style>
    </head>
    <body>
        <nav>
            <ul>
              <li><a href="index.jsp">Home</a></li>
              <li><a href="Registro.jsp">Registrar</a></li>
              <li><a href="Busqueda.jsp">Buscar</a></li>
              <li><a href="Materias.jsp">Matricular Materias</a></li>
              <li><a href="Login.jsp">Iniciar Sesion</a></li>
            </ul>
        </nav>

        <h1>Accede a tu Cuenta</h1>
        <div>
        <div class="hijo">
            <img src="Img/logo.png"alt="Logo UdeA">
            <form action="LoginServlet?action=login" method="post" onsubmit="return validacion()">
              <label for="cedula">Cédula:</label>
              <input placeholder="Cédula"  type="number" id="cedula" name="cedula" required>
              <br>

              <label for="pass">Contraseña:</label>
              <input placeholder="Contraseña" type="password" id="pass" name="password" required>
              <br>

              <input type="submit" value="Ingresar">

            </form>
          </div>
        </div>
        <c:if test="${not empty mensaje}">
            <p id="error">${mensaje}</p>
        </c:if>
        
        <script>
            function validacion(){
                let cedula=document.getElementById("cedula").value;
                let pass=document.getElementById("pass").value;
                let mensaje="";
                let validacion=true;
                if(cedula.length>20){
                    validacion=false;
                    mensaje+="La cédula no puede superar los 20 caracteres"+"<br>";
                }
                if(pass.length>20){
                    validacion=false;
                    mensaje+="La contraseña no puede superar los 20 caracteres";
                }
                if(!validacion){
                    let doc=document.getElementById("error");
                    doc.innerHTML=mensaje;
                }
                return validacion;
            }
        </script>
    </body>
</html>
