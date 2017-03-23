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
<title>Salario</title>
<link rel="stylesheet" type="text/css"
	href="./estilos/bootstrap/css/bootstrap.min.css" />
</head>
<body>
	<div class="container">
		<nav>
			<ul class="nav nav-pills">
				<li class="active"><a href="bienvenido.jsp">Inicio</a></li>
				<li><a href="directorio.jsp">Directorios</a></li>
				<li><a href="cerrarsesion.jsp">Salir</a></li>
			</ul>
			<nav>
				<header>
					<div class="panel panel-default">
						<div class="panel-body">
							<h1>Salarios por departamentos</h1>
							
						</div>
				</header>

				<%
					String query = "SELECT DEPARTMENT_NAME, SUM(SALARY) FROM EMPLOYEES e RIGHT JOIN DEPARTMENTS d ON (e.DEPARTMENT_ID = d.DEPARTMENT_ID) GROUP BY d.DEPARTMENT_ID";
					beanDB basededatos = new beanDB();
					String[][] tablares = basededatos.resConsultaSelectA3(query);
					ArrayList<DepartamentoSal> listaSalarios = new ArrayList<DepartamentoSal>();
					for (int i = 0; i < tablares.length; i++) {
						listaSalarios.add(new DepartamentoSal(tablares[i][0], tablares[i][1]));
					}
				%>
				<section>
					<div class="table-responsive">
						<table class="table table-bordered table-striped table-hover">
							<tr>
								<th>Departamentos</th>
								<th>Salario</th>
							</tr>
							<%
								for (DepartamentoSal d : listaSalarios) { //g es una variable tipo grupo que va recorriendo la lista
							%><tr>
								<td><%=d.getDepartmentName()%></td>
								<td><%=d.getSalario()%></td>
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