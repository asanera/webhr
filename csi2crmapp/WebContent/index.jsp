<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>hR info 1.0</title>
<script type="text/javascript" src="./js/login.js"></script>
<link rel="stylesheet" type="text/css" href="./estilos/estiloindex.css"
	media="screen" />

</head>
<body>
	<div class="login">
		<h1>Iniciar Sesión</h1>
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
</body>
</html>