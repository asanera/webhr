<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="mipk.beanDB"%>
<%@page import="objetoscrm.*"%>
<%
	try {
		String aux = session.getAttribute("usuario").toString();
	} catch (Exception e) {
		response.sendRedirect("cerrarsesion.jsp");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Jefes de Departamentos y Oficinas</title>
<link rel="stylesheet" type="text/css"
	href="./estilos/bootstrap/css/bootstrap.min.css" />
</head>
<body>
	<div class="container">
		<nav>
			<ul class="nav nav-pills">
				<li><a href="bienvenido.jsp">Inicio</a></li>
				<li class="active"><a href="directorio.jsp">Directorios</a></li>
				<li><a href="cerrarsesion.jsp">Salir</a></li>
			</ul>
			<nav>
				<header>
					<div class="panel panel-default">
						<div class="panel-body">
							<h1>Jefes de Departamentos y Oficinas</h1>
							
						</div>
				</header>

				<%
					String query = "SELECT FIRST_NAME, LAST_NAME, DEPARTMENT_NAME ,STREET_ADDRESS FROM EMPLOYEES E JOIN DEPARTMENTS D ON (D.MANAGER_ID = E.EMPLOYEE_ID) JOIN LOCATIONS L ON (D.LOCATION_ID = L.LOCATION_ID)";
					beanDB basededatos = new beanDB();
					String[][] tablares = basededatos.resConsultaSelectA3(query);
					ArrayList<JefeDepartamento> listaJefes = new ArrayList<JefeDepartamento>();
					for (int i = 0; i < tablares.length; i++) {
						listaJefes.add(new JefeDepartamento(tablares[i][0], tablares[i][1],tablares[i][2],tablares[i][3]));
					}
				%>
				<section>
					<div class="table-responsive">
						<table class="table table-bordered table-striped table-hover">
							<tr>
								<th>Nombre</th>
								<th>Apellidos</th>
								<th>Departamento</th>
								<th>Oficinas</th>
							</tr>
							<%
								for (JefeDepartamento j : listaJefes) { //g es una variable tipo grupo que va recorriendo la lista
							%><tr>
								<td><%=j.getNombre()%></td>
								<td><%=j.getApellidos()%></td>
								<td><%=j.getDepartamento()%></td>
								<td><%=j.getOficina()%></td>
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