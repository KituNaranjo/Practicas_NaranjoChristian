<%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
pageEncoding="ISO-8859-1" import="com.productos.negocio.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet" type="text/css">
<link href="css/estilos.css" rel="stylesheet" type="text/css">
<title>Editar Productos</title>
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
	<%
	String usuario;
	HttpSession sesion = request.getSession();
	if (sesion.getAttribute("usuario") == null) {
	%>
		<jsp:forward page="login.jsp">
		<jsp:param name="error" value="Debe registrarse" />
		</jsp:forward>
	<%
	} else {
		usuario = (String) sesion.getAttribute("usuario");
		int perfil = (Integer) sesion.getAttribute("perfil");
	%>
		<h3 class="title">Editar Producto</h3>
		<%
		out.println(usuario);
		}
		%>
		<%
		int cod = Integer.parseInt(request.getParameter("editarcod"));
		String des = request.getParameter("editardesc");
		float pre = Float.parseFloat(request.getParameter("editarprec"));
		int can = Integer.parseInt(request.getParameter("editarcant"));
		Producto mp = new Producto();
		mp.setId(cod);
		mp.setNombre(des);
		mp.setPrecio(pre);
		mp.setCantidad(can);
		boolean actualizado = mp.ModificarProducto(mp);
		if (actualizado) {
			response.sendRedirect("modificarProducto.jsp");
		} else {
			out.println("Algo salió mal");
		}
		%>
	</div>
</main>
</body>
</html>
