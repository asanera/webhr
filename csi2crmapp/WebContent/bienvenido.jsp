<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="mipk.Sesionok"%><html>
<head>
<% 
//aquí pongo todo el código java que quiera que mi servidor ejecute.
String usuario=request.getParameter("usuario");
String pass=request.getParameter("pass");
if (usuario == null) usuario="";
if (pass == null) pass="";
boolean ok=false;
try {
	String aux=session.getAttribute("usuario").toString();
	ok=true;
} catch (Exception e) {
	ok=false;
}
if (!ok)
	if (usuario.equals("admin") && pass.equals("1357")) {
		//usuario correcto - Tengo que crearle un handler de sesion
		session.setAttribute("usuario",usuario);
		ok=true;
	}

%><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="./estilos/bootstrap/css/bootstrap.min.css"/>
<script type="text/javascript" src="./estilos/bootstrap/js/bootstrap.min.js"></script>
<title>Bienvenido</title>
</head>
<body>
<% if (ok) { %>
<ul class="nav nav-pills">
  <li class="active"><a href="bienvenido.jsp">Inicio</a></li>
  <li><a href="verdatos.jsp">Ver datos</a></li>
  <li><a href="cerrarsesion.jsp">Salir</a></li>
  
</ul>
<h1>Bienvenido <%=session.getAttribute("usuario") %></h1>

<% } else { 
	//AHORA PONGO EL HTML DE SESION INCORRECTA %>
<h1>Usuario y/o contraseña incorrectos.</h1>
Por favor, inténtelo de nuevo.<br/>
<a href="index.jsp">Volver</a>
<% } %>
</body>
</html>