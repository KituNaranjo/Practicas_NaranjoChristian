<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.productos.negocio.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet" type="text/css">
<link href="css/estilos.css" rel="stylesheet" type="text/css">
<title>Modificar Productos</title>
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
<div align="center" style="padding: 40px;">
	<%String usuario;
	HttpSession sesion = request.getSession();
 	if (sesion.getAttribute("usuario") == null)
 	{
 	%>
 		<jsp:forward page="login.jsp">
 		<jsp:param name="error" value="Debe registrarse"/>
 		</jsp:forward>
 	<%
 	} else {
 		usuario=(String)sesion.getAttribute("usuario");
 		int perfil=(Integer)sesion.getAttribute("perfil");
 	%>
 		<h3 class="title">Modificar un producto</h3>
	<%
	out.println(usuario);
 	}
	%>
	<form action="respuestaProducto.jsp" method="post">
			Escoja la categoría
  			<% 
	  			Categoria cat=new Categoria();
	  			out.print(cat.mostrarCategoria());
	  		%>
	  		<br>
	  		<input type="submit"/>
	</form>
  	</div>
</main>
</body>
</html>