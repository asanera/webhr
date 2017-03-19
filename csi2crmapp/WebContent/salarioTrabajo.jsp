<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="mipk.beanDB"%>
<%@page import="objetoscrm.*"%>
<%
try {
	String aux=session.getAttribute("usuario").toString();
} catch (Exception e) {
	response.sendRedirect("cerrarsesion.jsp");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Salario Trabajos</title>
<link rel="stylesheet" type="text/css"
	href="./estilos/bootstrap/css/bootstrap.min.css" />
</head>
<body>
	<div class="container">
		<nav>
			<ul class="nav nav-pills">
				<li class="active"><a href="bienvenido.jsp">Inicio</a></li>
				<li><a href="verdatos.jsp">Ver datos</a></li>
				<li><a href="cerrarsesion.jsp">Salir</a></li>
			</ul>
			<nav>
				<header>
					<div class="panel panel-default">
						<div class="panel-body">
							<h1>Salarios por Oficios</h1>

						</div>
				</header>
				<% 
String query="SELECT JOB_TITLE, SUM(SALARY) FROM EMPLOYEES E LEFT JOIN JOBS J ON (E.JOB_ID = J.JOB_ID) GROUP BY J.JOB_ID ORDER BY JOB_TITLE";
beanDB basededatos = new beanDB();
String [][] tablares = basededatos.resConsultaSelectA3(query);
ArrayList<TrabajoSal> listaTrabajo = new ArrayList<TrabajoSal>();
for (int i=0; i<tablares.length;i++) {
	listaTrabajo.add(new TrabajoSal(tablares[i][0],tablares[i][1]));
}
%>
				<section>
					<div class="table-responsive">
						<table class="table table-bordered table-striped table-hover">
							<tr>
								<th>Paises</th>
								<th>Salario</th>
							</tr>
							<%
								for (TrabajoSal t : listaTrabajo) { 
							%><tr>
								<td><%=t.getTrabajos()%></td>
								<td><%=t.getSalario()%></td>
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
</body>
</html>