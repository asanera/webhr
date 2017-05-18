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
					<h1>Inserta oficios</h1>
				</div>
			</div>
		</header>
		<div class="row">
			<div class="col-md-5">
				<form role="form" id="formOficios" name="oficios" action="datosOficios.jsp" method="get">
					<div class="form-group">
						<label for="jobar">Titulo del oficio</label> <input type="text"
							class="form-control" id="jobar" name="jobar"
							placeholder="Introduce el nombre del oficio">
					</div>
					<div class="form-group">
						<label for="mile">Sueldo minimo</label> <input type="number" min=0
							class="form-control" id="mile" name="mile"
							placeholder="Sueldo minimo" step="any">
					</div>
					<div class="form-group">
						<label for="male">Sueldo maximo</label> <input type="number" min=0
							class="form-control" id="male" name="male"
							placeholder="Sueldo maximo" step="any">
					</div>
					<button type="submit" class="btn btn-default">Enviar</button>
				</form>
			</div>

		</div>

	</div>
</body>
</html>