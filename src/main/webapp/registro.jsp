<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.productos.negocio.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="css/estilos.css" rel="stylesheet" type="text/css">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet" type="text/css">
<title>Catálogo</title>
</head>
<body>
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
	<h1>Registro</h1>
	<form action="respuesta.jsp"> 
	<table border="0">
		<tr>
			<td>Nombre:</td>
			<td><input type="text" name="txtNombre" required/>*</td>
		</tr>
		<tr>
			<td>Clave:</td>
			<td><input type="text" name="txtClave" required/>*</td>
		</tr>
		<tr>
			<td>Cedula:</td>
			<td><input type="text" name="txtCedula" maxlength="10"/></td>
		</tr>
		<tr>
			<td>Correo:</td>
			<td><input type="email" name="txtCorreo" maxlength="100"/></td>
		</tr>
		<tr>
			<td>Estado Civil:</td>
			<td>
				<select name="cmbECivil">
					<option value="Soltero">Soltero</option>
					<option value="Casado">Casado</option>
					<option value="Divorciado">Divorciado</option>
					<option value="Viudo">Viudo</option>
				</select>
			</td>
		</tr>
		<tr>
			<td>Lugar Residencia:</td>
			<td>
				<input type="radio" name="rdResidencia" value="Sur"/>Sur
				<input type="radio" name="rdResidencia" value="Norte"/>Norte
				<input type="radio" name="rdResidencia" value="Centro"/>Centro
			</td>
		</tr>
		<tr>
			<td>Foto: </td>
			<td> 
				<input type="file" name="fileFoto" accept=".jpg, .jpeg, .png" />
			</td>
		</tr>
		<tr>
  			<td>Hoja de vida: </td>
  				<td> 
    				<input type="file" name="hojaDeVida" accept=".pdf" maxlength="5242880" />
  				</td>
		</tr>
		<tr>
			<td>Mes y año de nacimiento: </td>
			<td> <input type="date" name="fecha" required/>
			</td>
		</tr>
		<tr>
			<td>Color Favorito: </td>
			<td>
				<input type="color" name="colorFavorito"/>
			</td>
		</tr>
		<tr>
			<td>
				<input type="submit">
				<input type="reset">
			</td>
		</tr>
	</table>
</form>
	<h5>
		*CAMPO OBLIGATORIO
	</h5>
	<footer>
		<ul>
         	<li><a href="https://www.facebook.com/kitu.naranjo"><i class="fab fa-facebook fa-2x"></i></a></li>
 			<li><a href="https://www.instagram.com/kitu.naranjo"><i class="fab fa-instagram fa-2x"></i></a></li>
 			<li><a href="https://www.twitter.com/kitunaranjo"><i class="fab fa-twitter fa-2x"></i></a></li>
        </ul>
    </footer>
</body>
</html>