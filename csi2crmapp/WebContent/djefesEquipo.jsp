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
<title>Jefes de Equipos</title>
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
				<li class="active"><a href="directorio.jsp">Directorios</a></li>
				<li><a href="oficios.jsp">Oficios</a></li>
				<li><a href="cerrarsesion.jsp">Salir</a></li>
			</ul>
		</nav>
		<header>
			<div class="panel panel-default">
				<div class="panel-body">
					<h1>Jefes de Equipos</h1>

				</div>
			</div>
		</header>

		<%
					String query = "SELECT FIRST_NAME, LAST_NAME FROM EMPLOYEES	WHERE EMPLOYEE_ID IN (SELECT manager_id FROM EMPLOYEES)";
					beanDB basededatos = new beanDB();
					String[][] tablares = basededatos.resConsultaSelectA3(query);
					ArrayList<JefeEquipo> listaJefes = new ArrayList<JefeEquipo>();
					for (int i = 0; i < tablares.length; i++) {
						listaJefes.add(new JefeEquipo(tablares[i][0], tablares[i][1]));
					}
				%>
		<section>
			<div class="table-responsive">
				<table class="table table-bordered table-striped table-hover">
					<tr>
						<th>Nombre</th>
						<th>Apellidos</th>
					</tr>
					<%
								for (JefeEquipo j : listaJefes) { //g es una variable tipo grupo que va recorriendo la lista
							%><tr>
						<td><%=j.getNombre()%></td>
						<td><%=j.getApellidos()%></td>
					</tr>
					<%
								}
							%>
				</table>

			</div>

		</section>
	</div>
</body>
</html>