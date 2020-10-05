<%-- 
    Document   : index
    Created on : 3/10/2020, 12:26:20 AM
    Author     : andres
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>UdeA</title>
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
          img{
              position: relative;
              text-align:center;
              width: 40%;
              left:30%;
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
            </ul>
        </nav>

        <main>
            <h1>Bienvenido a Nuestro Sistema de Matriculas</h1>
            <img src="Img/logo-udea.png" alt="Universidad de Antioquia">
         </main>
    </body>
</html>
