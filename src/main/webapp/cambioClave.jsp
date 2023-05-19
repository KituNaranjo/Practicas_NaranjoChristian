<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.productos.seguridad.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet" type="text/css">
<link href="css/estilos.css" rel="stylesheet" type="text/css">
<title>Cambio Clave</title>
</head>
<body>
<main>
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
	<h3 class="title">Cambio de clave</h3>
    <form method="post" action="cambioClave.jsp">
    <table>
        <tr>
            <td>Usuario:</td>
            <td><input type="text" name="login" required></td>
        </tr>
        <tr>
            <td>Contrase�a actual:</td>
            <td><input type="password" name="claveActual" required></td>
        </tr>
        <tr>
            <td>Nueva contrase�a:</td>
            <td><input type="password" name="nuevaContrasena" required></td>
        </tr>
        <tr>
            <td></td>
            <td><input type="submit" value="Cambiar contrase�a"></td>
        </tr>
    </table>
	</form>
    <%
    Usuario user= new Usuario();
    String login = request.getParameter("login");
    String claveActual = request.getParameter("claveActual");
    String nuevaContrasena = request.getParameter("nuevaContrasena");
    boolean cambio = user.cambiarClave(login, claveActual, nuevaContrasena);
    if (cambio) {
        response.sendRedirect("menu.jsp");
        out.println("�Contrase�a cambiada exitosamente!");
    } else {
        out.println("No se pudo cambiar la contrase�a. Por favor, int�ntalo nuevamente.");
    }

    %>
</main>
</body>
</html>