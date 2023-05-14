<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" session="true" import="com.productos.seguridad.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet" type="text/css">
<link href="css/estilos.css" rel="stylesheet" type="text/css">
<title>Verificar Login</title>
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
	<div align="center" style="padding: 40px; background-color: #D6D6D6;">

		<%
		Usuario usuario=new Usuario();
		String nlogin=request.getParameter("usuario");
		String nclave=request.getParameter("clave");
		HttpSession sesion=request.getSession();
		boolean respuesta=usuario.verificarUsuario(nlogin,nclave);
		if (respuesta)
		{
		sesion.setAttribute("usuario", usuario.getNombre());
		sesion.setAttribute("perfil", usuario.getPerfil()); 
		response.sendRedirect("menu.jsp");
		}
		else
		{
		%>
		<jsp:forward page="login.jsp">
		<jsp:param name="error" value="Datos incorrectos vuelva a intentarlo"/>
		</jsp:forward>
		<%
		}
		%>

  	</div>
</body>
</html>
