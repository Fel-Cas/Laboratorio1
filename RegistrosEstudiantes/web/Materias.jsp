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
            body{
            padding:1%;
            margin:33px;
            font-size:130%;

          }
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
              #error,#errorU{
                  color:red;
                  font-size: 140%;
                  text-align: center;
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
              <li><a href="Materias.jsp">Matricular Materias</a></li>
              <li><a href="Login.jsp">Iniciar Sesion</a></li>
            </ul>
        </nav>
        <h1>Registrar Materias</h1>
        <div>
           <form action="RegistroServlet?action=registroMaterias"  method="post" onsubmit="return Validacion()">
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
                  <td>4</td>
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
               <input type="number"name="cedula" id="cedula" required="" >
               <br>
               <br>
               <input type="submit" value="Registrar Materias">
            </form>
            <p id="error"></p>
        </div>
        <c:if test="${not empty mensaje}">
                <p id="errorU">${mensaje}</p>            
        </c:if> 
        <script>
            function Validacion(){
                let entrada=document.getElementsByName("materia");
                let cedula=document.getElementById("cedula").value;
                var num=0;
                for(let i=0;i<entrada.length;i++){
                       if(entrada[i].checked){
                       num+=1;
                    }
                }
                var salida=""
                let validacion=true;
                if(num==0){
                  salida="Debe seleccionar por lo menos una materia."+"<br>";
                  validacion=false;
                }
                if(cedula.length>20 || cedula.length<1 ){
                    salida+="La cedula debe tener menos de 20 caracteres y minimo 1";
                    validacion=false;
                }
                if(!validacion){
                    let documento=document.getElementById("error");
                    documento.innerHTML=salida;
                }
                return validacion;
            }
            
        </script>
    </body>
</html>
