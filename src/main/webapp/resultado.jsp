<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.productos.negocio.Producto" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="css/estilos.css" rel="stylesheet" type="text/css">
	<title>Productos</title>
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
	<%
		int idCategoria = Integer.parseInt(request.getParameter("cmbCategoria"));
		Producto producto = new Producto();
		String tablaProductos = producto.buscarProductoCategoria(idCategoria);
	%>
	<h3 class="title">Productos de la categoría seleccionada:</h3>
	<%= tablaProductos %>
	<a href="consultaCategoria.jsp"><input type="button" value="Regresar"></a>
</body>
</html>
