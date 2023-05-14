<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet" type="text/css">
<link href="css/estilos.css" rel="stylesheet" type="text/css">
<title>Login</title>
</head>
<body>
<header>
		<h1>
			CHRISTECH
		</h1>
		<h2 class="destacado">
			Portátiles desde la gama más baja hasta la más avanzada
		</h2>
	</header>
	<nav>
		<a href="index.jsp">Inicio</a>
		<a href="catalogo_buscar.jsp">Catálogo</a>
		<a href="login.jsp">Login</a>
	</nav>
	<%if(request.getParameter("error")!=null)
		{
			out.println(request.getParameter("error"));
		} 
	%>
	<h1>Login</h1>
		<div align="center" style="padding: 40px;">
	  	<form action="verificarLogin.jsp" method="post">
		   	<table border="0" >
		   		<tr><td>Usuario:</td><td>
		   			<input type="text" name="usuario" required/></td></tr>
				<tr><td>Clave:</td><td>
					<input type="text" name="clave" required/></td></tr>
				<tr>
					<td><input type="submit"/></td>
					<td><input type="reset"/></td>
				</tr>		
			</table>
		</form>
		<br>
		¿No tienes cuenta? Es momento de que te registres. <a href="registro.jsp"> Regístrate</a>
  	</div>
  	<footer>
		<ul>
         	<li><a href="https://www.facebook.com/kitu.naranjo"><i class="fab fa-facebook fa-2x"></i></a></li>
 			<li><a href="https://www.instagram.com/kitu.naranjo"><i class="fab fa-instagram fa-2x"></i></a></li>
 			<li><a href="https://www.twitter.com/kitunaranjo"><i class="fab fa-twitter fa-2x"></i></a></li>
        </ul>
    </footer>
</body>
</html>
