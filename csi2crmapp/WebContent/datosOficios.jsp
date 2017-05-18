<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="mipk.beanDB"%>
<%@page import="objetoscrm.*"%>
<%
	try {
		String aux = session.getAttribute("usuario").toString();
	} catch (Exception e) {
		response.sendRedirect("directorio.jsp");
	}
%>
<%
	String titulo = request.getParameter("jobar");
	String sueldoMin = request.getParameter("male");
	String sueldoMax = request.getParameter("mile");
	boolean esCorrecto = true;
	if (titulo == "" || sueldoMax == "" || sueldoMin == "")
		esCorrecto = false;
	if (esCorrecto) {
		String insert = "INSERT INTO JOBS (JOB_TITLE, MIN_SALARY, MAX_SALARY) VALUES (" + titulo + ","
				+ sueldoMin + "," + sueldoMax + ")";
		beanDB basededatos = new beanDB();
		basededatos.insert(insert);
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Empleados</title>
<link rel="stylesheet" type="text/css"
	href="./estilos/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css"
	href="./estilos/personalizado.css"></link>
</head>
<body>
	<div class="container">
		<nav>
			<ul class="nav nav-pills">
				<li><a href="bienvenido.jsp">Inicio</a></li>
				<li><a href="directorio.jsp">Directorios</a></li>
				<li class="active"><a href="oficios.jsp">Oficios</a></li>
				<li><a href="cerrarsesion.jsp">Salir</a></li>
			</ul>
		</nav>
		<header>
			<div class="panel panel-default">
				<div class="panel-body">
					<h1>Ver oficios</h1>
				</div>
			</div>
		</header>
		Todo ha sido un exito

	</div>
</body>
</html>