<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
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
<div class="container">
<% if (ok) { %>
<nav>
<ul class="nav nav-pills">
  <li class="active"><a href="bienvenido.jsp">Inicio</a></li>
  <li><a href="#">Ver datos</a></li>
  <li><a href="cerrarsesion.jsp">Salir</a></li>
  
</ul>
<nav>
<header>
<div class="panel panel-default">
  <div class="panel-body">
    <h1>Bienvenido <%=session.getAttribute("usuario") %></h1>
  </div>
</header>
<section>
	<article>
   <div class="col-md-6"">
   <h3>Consultar salarios por departamentos</h3>
  <div class="btn-toolbar" role="toolbar">
  <a href="salario.jsp"><button type="button" class="btn btn-default btn-lg">
    <span class="glyphicon glyphicon-star"></span> Ver datos
  </button></a>
   
   </div>
</div>
</article>
<article>
   <div class="col-md-6"">
   <h3>Consultar salarios por paises</h3>
  <div class="btn-toolbar" role="toolbar">
  <a href="salarioPaises.jsp"><button type="button" class="btn btn-default btn-lg">
    <span class="glyphicon glyphicon-star"></span> Ver datos
  </button></a>
   
   </div>
</div>
</article>
<article>
   <div class="col-md-6"">
   <h3>Consultar salarios por oficios</h3>
  <div class="btn-toolbar" role="toolbar">
  <a href="salarioTrabajo.jsp"><button type="button" class="btn btn-default btn-lg">
    <span class="glyphicon glyphicon-star"></span> Ver datos
  </button></a>
   
   </div>
</div>
</article>
</section>

<% } else { 
	//AHORA PONGO EL HTML DE SESION INCORRECTA %>
<div class="alert alert-danger">Error al iniciar sesión</div>
<a href="index.jsp">Volver</a>
<% } %>
</div>
</body>
</html>