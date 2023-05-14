<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.productos.negocio.Categoria" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link href="css/estilos.css" rel="stylesheet" type="text/css">
	<title>Seleccionar Categoría</title>
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
	<h1 class="title">Seleccione una categoría:</h1>
	<form action="resultado.jsp" method="get">
		<%
			Categoria categoria = new Categoria();
			String opcionesCategoria = categoria.mostrarCategoria();
			out.println(opcionesCategoria);
		%>
		<input type="submit" value="Buscar">
	</form>
</body>
</html>
