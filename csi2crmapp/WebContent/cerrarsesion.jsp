<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="mipk.Sesionok"%>
<html>
<%
session.invalidate();
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="./js/login.js"></script>
<link rel="stylesheet" type="text/css"
	href="./estilos/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="./estilos/estiloindex.css" media="screen" />
<title>!Hasta Pronto</title>
</head>
<body>

	<div class="login">
		<h1>Iniciar Sesión</h1>
		<div class="alert alert-success alert-dismissable">
 			 <button type="button" class="close" data-dismiss="alert">&times;</button>
  			Esperamos volverte a ver pronto¡
		</div>
		<form action="bienvenido.jsp" method="post" name="iniciosesion">
			<input type="text" name="usuario" class="inputgris"
				onkeypress="return compruebaalfan(this,event);" maxlength="10"
				class="form-control" placeholder="Usuario" id="username" /> 
				<input class="inputgris"
				 name="pass" type="password" placeholder="Contraseña" id="password"
				required="required" onkeypress="return compruebaalfan(this,event);" />
			<button type="submit" id="login" name="send"
				class="btn btn-primary btn-block btn-large"
				onclick="compruebayenvia();">Entrar</button>
		</form>
	
	</div>
	<script src="http://code.jquery.com/jquery.js"></script>
 
    <!-- Todos los plugins JavaScript de Bootstrap (también puedes
         incluir archivos JavaScript individuales de los únicos
         plugins que utilices) -->
    <script src="./estilos/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>