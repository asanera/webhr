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
	String id = request.getParameter("joid");
	String titulo = request.getParameter("jobar");
	String sueldoMin = request.getParameter("male");
	String sueldoMax = request.getParameter("mile");
	boolean esCorrecto = true;
	if (titulo == null || sueldoMax == null || sueldoMin == null)
		esCorrecto = false;
	if (esCorrecto) {
		String insert = "INSERT INTO JOBS (JOB_ID,JOB_TITLE, MIN_SALARY, MAX_SALARY) VALUES ('" +id +"','"
				+ titulo + "','"+sueldoMin+"','"+sueldoMax+"')";
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
					<h1>Inserta oficios</h1>
				</div>
			</div>
		</header>
		<div class="row">
			<div class="col-md-5">
				<form role="form" id="formOficios" name="oficios" action="oficios.jsp" method="get">
					<div class="form-group">
						<label for="joid">Id</label> <input type="text"
							class="form-control" id="joid" name="joid"
							placeholder="Introduce el id" required>
					</div>
					<div class="form-group">
						<label for="jobar">Titulo del oficio</label> <input type="text"
							class="form-control" id="jobar" name="jobar"
							placeholder="Introduce el nombre del oficio" required>
					</div>
					<div class="form-group">
						<label for="mile">Sueldo minimo</label> <input type="number" min=0
							class="form-control" id="mile" name="mile"
							placeholder="Sueldo minimo" step="any" required>
					</div>
					<div class="form-group">
						<label for="male">Sueldo maximo</label> <input type="number" min=0
							class="form-control" id="male" name="male"
							placeholder="Sueldo maximo" step="any" required>
					</div>
					<button type="submit" class="btn btn-default">Enviar</button>
				</form>
			</div>
		<%
			String query = "SELECT JOB_ID, JOB_TITLE, MIN_SALARY, MAX_SALARY FROM JOBS";
			beanDB basededatos = new beanDB();
			String[][] tablares = basededatos.resConsultaSelectA3(query);
			ArrayList<Empleos> listaOficios = new ArrayList<Empleos>();
			for (int i = 0; i < tablares.length; i++) {
				listaOficios.add(new Empleos(tablares[i][0],tablares[i][1],tablares[i][2],tablares[i][3]));
			}
		%>
			<div class="col-md-6">
			
			<div class="table-responsive">
				<table class="table table-bordered table-striped table-hover">
					<tr>
						<th>Id</th>
						<th>Titulo</th>
						<th>Sueldo Maximo</th>
						<th>Sueldo Minimo</th>
					</tr>
					<%
						for (Empleos e : listaOficios) {
					%><tr>
						<td><%=e.getId()%></td>
						<td><%=e.getTitulo()%></td>
						<td><%=e.getSueldoMax()%></td>
						<td><%=e.getSueldoMin()%></td>
					</tr>
					<%
						}
					%>
				</table>
			</div>
			
			</div>


		</div>

	</div>
</body>
</html>