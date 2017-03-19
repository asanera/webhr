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
<title>Salario paises</title>
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
							<h1>Salarios por paises</h1>

						</div>
				</header>
				<% 
String query="SELECT COUNTRY_NAME, SUM(SALARY) FROM EMPLOYEES E LEFT JOIN DEPARTMENTS D ON ( E. DEPARTMENT_ID=D.DEPARTMENT_ID) LEFT JOIN LOCATIONS L ON (D.LOCATION_ID = L.LOCATION_ID) LEFT JOIN COUNTRIES C ON ( L.COUNTRY_ID = C.COUNTRY_ID) GROUP BY C.COUNTRY_ID";
beanDB basededatos = new beanDB();
String [][] tablares = basededatos.resConsultaSelectA3(query);
ArrayList<PaisSal> listapaises = new ArrayList<PaisSal>();
for (int i=0; i<tablares.length;i++) {
	listapaises.add(new PaisSal(tablares[i][0],tablares[i][1]));
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
								for (PaisSal p : listapaises) { 
							%><tr>
								<td><%=p.getCountryName()%></td>
								<td><%=p.getSalario()%></td>
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