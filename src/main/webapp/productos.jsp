<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="css/estilos.css" rel="stylesheet" type="text/css">
<title>Productos</title>
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
<div align="left" style="padding: 40px;">
	<%String usuario;
		HttpSession sesion = request.getSession();
		if (sesion.getAttribute("usuario") == null) {
	%>
 		<jsp:forward page="login.jsp">
 		<jsp:param name="error" value="Debes registrarse"/>
 		</jsp:forward>
 	<%
 	} else {
 		usuario=(String)sesion.getAttribute("usuario");
 		int perfil=(Integer)sesion.getAttribute("perfil");
 	%>
 		<h3 class="title">Gestión de Productos</h3>
	<%
		out.println(usuario);
 	}
	%>
	<ul>
		<li><a href="nuevoProducto.jsp">Nuevo Producto</a></li>
		<li><a href="modificarProducto.jsp">Modificar o Eliminar Producto</a></li>
		<li><a href="añadirProductoOferta.jsp">Añadir producto en oferta</a></li>
	</ul>
  	</div>
</main>
</body>
</html>