<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.productos.negocio.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="css/estilos.css" rel="stylesheet" type="text/css">
<title>Cat�logo</title>
</head>
<body>
<header>
		<h1>
			<img src="imagenes/Logo.png" alt="CHRISTECH" width="200" height="200">
			<br>CHRISTECH
		</h1>
		<h2 class="destacado">
			Port�tiles desde la gama m�s baja hasta la m�s avanzada
		</h2>
	</header>
	<nav>
		<a href="index.jsp">Inicio</a>
		<a href="catalogo_buscar.jsp">Cat�logo</a>
		<a href="login.jsp">Login</a>
	</nav>
	<h3 class="title">
		Cat�logo
	</h3>
	<ul>
		<li><a href="todos.jsp">Mostrar todos los productos</a>
		<li><a href="consultaCategoria.jsp">Consulta de todos los productos por categor�a</a>
	</ul>
	<%
    Producto producto = new Producto();
    out.print(producto.buscarProductoCategoria(Integer.parseInt(request.getParameter("cmbCategoria"))));
    %>
</body>
</html>