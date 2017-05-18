<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="mipk.beanDB"%>
<%@page import="objetoscrm.*"%>
<%@page import="java.util.ArrayList"%>


<!DOCTYPE html>
<%@page import="mipk.Sesionok"%><html>
<head>
<%
	//aquí pongo todo el código java que quiera que mi servidor ejecute.
	String usuario = request.getParameter("usuario");
	String pass = request.getParameter("pass");
	if (usuario == null)
		usuario = "";
	if (pass == null)
		pass = "";
	boolean ok = false;
	try {
		String aux = session.getAttribute("usuario").toString();
		ok = true;
	} catch (Exception e) {
		ok = false;
	}
	if (!ok)
		if (usuario.equals("Alvaro") && pass.equals("123")) {
			//usuario correcto - Tengo que crearle un handler de sesion
			session.setAttribute("usuario", usuario);
			ok = true;
		}
%><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css"
	href="./estilos/bootstrap/css/bootstrap.min.css" />
<script type="text/javascript" src="./js/jquery-3.2.1.min.js"></script>
<script type="text/javascript"
	src="./estilos/bootstrap/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="./estilos/personalizado.css"></link>
<title>Bienvenido</title>
</head>
<body>
	<div class="container">
		<%
			if (ok) {
		%>
		<nav>
			<ul class="nav nav-pills">
				<li class="active"><a href="bienvenido.jsp">Inicio</a></li>
				<li><a href="directorio.jsp">Directorios</a></li>
				<li><a href="oficios.jsp">Oficios</a></li>
				<li><a href="cerrarsesion.jsp">Salir</a></li>
			</ul>
		</nav>
		<header>
			<div class="panel panel-default">
				<div class="panel-body">
					<h1>
						Bienvenido
						<%=session.getAttribute("usuario")%></h1>
				</div>
			</div>
		</header>
		<section>
			<%
						String query = "SELECT DEPARTMENT_NAME FROM DEPARTMENTS";
							beanDB basededatos = new beanDB();
							String[][] tablares = basededatos.resConsultaSelectA3(query);
							ArrayList<String> listaDepartamentos = new ArrayList<String>();
							for (int i = 0; i < tablares.length; i++) {
								listaDepartamentos.add(tablares[i][0]);
							}
					%>
			<article>
				<div class="col-md-6">
					<div class="panel panel-primary">
						<div class="panel-heading">
							<h3>Consultar salarios por departamentos</h3>
						</div>
						<div class="row">
							<form name="selecionar" action="salario.jsp" method="get">
								<div class="panel-body">
									<div class="col-md-4">
										<div class="btn-toolbar" role="toolbar">
											<button type="submit" class="btn btn-default btn-lg">
												<span class="glyphicon glyphicon-info-sign"></span> Ver
												datos
											</button>
										</div>
									</div>
									<div class="col-md-5">
										<select class="form-control" name="elegirDepartamento"
											id="elegirDepartamento">
											<option>Todos</option>
											<%for (int i = 0; i < listaDepartamentos.size(); i++) {%>
											<option><%=listaDepartamentos.get(i)%></option>
											<%}%>
										</select>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</article>
			<article>
				<div class="col-md-6">
					<div class="panel  panel-primary">
						<div class="panel-heading">
							<h3>Consultar salarios por paises</h3>
						</div>
						<div class="panel-body">
							<div class="btn-toolbar" role="toolbar">
								<a href="salarioPaises.jsp"><button type="button"
										class="btn btn-default btn-lg">
										<span class="glyphicon glyphicon-info-sign"></span> Ver datos
									</button></a>

							</div>
						</div>
					</div>
				</div>
			</article>
			<article>
				<div class="col-md-6">
					<div class="panel  panel-primary">
						<div class="panel-heading">
							<h3>Consultar salarios por oficios</h3>
						</div>
						<div class="panel-body">
							<div class="btn-toolbar" role="toolbar">
								<a href="salarioTrabajo.jsp"><button type="button"
										class="btn btn-default btn-lg">
										<span class="glyphicon glyphicon-info-sign"></span> Ver datos
									</button></a>
							</div>
						</div>
					</div>
				</div>
			</article>
		</section>
		<!-- Librería jQuery requerida por los plugins de JavaScript -->
		<script src="http://code.jquery.com/jquery.js"></script>
		<!-- Todos los plugins JavaScript de Bootstrap (también puedes
         incluir archivos JavaScript individuales de los únicos
         plugins que utilices) -->
		<script src="./estilos/bootstrap/js/bootstrap.min.js"></script>
	</div>

	<%
		} else {
			//AHORA PONGO EL HTML DE SESION INCORRECTA
	%>
	<script>
		location.href = 'loginError.jsp';
	</script>
	<%
		}
	%>


</body>
</html>