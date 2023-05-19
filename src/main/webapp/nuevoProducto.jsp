<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.productos.negocio.*"%>
<%@ page import="java.io.File" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="css/estilos.css" rel="stylesheet" type="text/css">
<title>Nuevo Producto</title>
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
 		<h3 class="title">Ingresar un producto</h3>
	<%
	out.println(usuario);
	 }
	%>
	<%--<%String folderPath = "C:\\Practica";
	//File folder = new File(folderPath);
	//if (!folder.exists()) {
		//boolean created = folder.mkdirs();
		//}--%>
	<form action="registroProducto.jsp" method="post">
	<table>
		<tr>
			<td>Id Producto</td>
			<td><input type="text" name="id" required="required"></td>
		</tr>
		<tr>
			<td>Categoría</td>
			<td><% 
	  			Categoria cat=new Categoria();
	  			out.print(cat.mostrarCategoria());
	  		%></td>
		</tr>
		<tr>
			<td>Nombre</td>
			<td><input type="text" name="nombre" required="required"></td>
		</tr>
		<tr>
			<td>Cantidad</td>
			<td><input type="text" name="cantidad" required="required"></td>
		</tr>
		<tr>
			<td>Precio</td>
			<td><input type="text" name="precio" required="required"></td>
		</tr>
		<tr>
			<td>Foto del producto</td>
			<td> 
				<input type="file" name="fileFoto" accept=".jpg, .jpeg, .png" />
			</td>
		</tr>
		<tr>
			<td><input type="submit"/></td>
			<td><input type="reset"/></td>
		</tr>
	</table>
	<h3>*Campo obligatorio</h3>
	</form>	    
  	</div>
</main>
</body>
</html> 