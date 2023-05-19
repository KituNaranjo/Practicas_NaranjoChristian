<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.productos.negocio.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet" type="text/css">
<link href="css/estilos.css" rel="stylesheet" type="text/css">
<title>Buscar Productos</title>
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
	if (sesion.getAttribute("usuario") == null) {
	%>
		<jsp:forward page="login.jsp">
 		<jsp:param name="error" value="Debe registrarse"/>
 		</jsp:forward>
	<%
	} else {
		usuario=(String)sesion.getAttribute("usuario");
 		int perfil=(Integer)sesion.getAttribute("perfil");
	%>
		<h3 class="title">Buscar un producto</h3>
	<%
	out.println(usuario);
 	}
	%>
		<%
			int cod = Integer.parseInt(request.getParameter("cod"));
			Producto mp = new Producto();
			mp.ConsulEditarProductos(cod);
		%>
	<form action="EditarProductos.jsp" method="post">
		<table>
			<tr>
				<td>Codigo Producto:</td>
				<td><input type="text" name="editarcod" value="<%=cod%>"></td>
			</tr>
			<tr>
				<td>Categoria</td>
				<td><output><%=mp.getCat() %></output></td>
			</tr>
			<tr>
				<td>Descripcion</td>
				<td><input type="text" name="editardesc" value="<%=mp.getNombre()%>"></td>
			</tr>
			<tr>
				<td>Precio</td>
				<td><input type="text" name="editarprec" value="<%=mp.getPrecio()%>"></td>
			</tr>
			<tr>
				<td>Cantidad</td>
				<td><input type="text" name="editarcant" value="<%=mp.getCantidad()%>"></td>
			</tr>
		</table>
		<br>
		<br><input type="submit" name="Actualizar">	
	</form>
  	</div>
</main>
</body>
</html>