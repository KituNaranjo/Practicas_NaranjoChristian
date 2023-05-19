<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" session="true" import="com.productos.seguridad.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet" type="text/css">
<link href="css/estilos.css" rel="stylesheet" type="text/css">
<title>Christech</title>
</head>
<body>
<main>
	<header>
		<h1>
			<img src="imagenes/Logo.png" alt="CHRISTECH" width="200" height="200">
			<br>CHRISTECH
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
	<%String usuario;
	HttpSession sesion = request.getSession();
	if (sesion.getAttribute("usuario") == null) {
	%>
	<jsp:forward page="login.jsp">
	<jsp:param name="error" value="Debe registrarse correctamente en el sistema."/>
 	</jsp:forward>
 	<%
 	}
 	else
 	{
 	usuario=(String)sesion.getAttribute("usuario");
 	int perfil=(Integer)sesion.getAttribute("perfil");
 	%>
	<h1>Sitio Privado de Productos</h1>
	<h4>Bienvenido a CHRISTECH</h4>
	<%
	out.println(usuario);
	%>
	<%
	Pagina pagina=new Pagina();
	String menu=pagina.mostrarMenu(perfil);
	out.print(menu);
 	}
	%>
	<footer>
		<ul>
         	<li><a href="https://www.facebook.com/kitu.naranjo"><i class="fab fa-facebook fa-2x"></i></a></li>
 			<li><a href="https://www.instagram.com/kitu.naranjo"><i class="fab fa-instagram fa-2x"></i></a></li>
 			<li><a href="https://www.twitter.com/kitunaranjo"><i class="fab fa-twitter fa-2x"></i></a></li>
        </ul>
        	<h3>Todos los derechos reservados Christian Naranjo © 2023 CHRISTECH</h3>
    </footer>
</main>
</body>
</html>