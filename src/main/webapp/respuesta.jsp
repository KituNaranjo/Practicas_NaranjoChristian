<%@ page import="java.text.DateFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.Calendar" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>REGISTRO</title>
 <link href="css/estilos.css" rel="stylesheet" type="text/css">
 <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet" type="text/css">
</head>
<body>
 <header>
            <h1>CHRISTECH</h1>
            <h2 class="destacado">De todo a un mejor precio</h2>
        </header>
        <nav>
            <a href="index.jsp">Inicio</a>
         </nav>
         <div style="text-align: center;"> 
         <br>
	<%
	out.print("<strong> Nombre: </strong>" + request.getParameter("txtNombre") + "</br>");
	String clave = request.getParameter("txtClave");
	String cedula = request.getParameter("txtCedula");
	String estadoCivil = request.getParameter("cmbECivil");
	String residencia = request.getParameter("rdResidencia");
	String foto = request.getParameter("fileFoto");
	String hojadevida = request.getParameter("hojaDeVida");
	String color = request.getParameter("colorFavorito");
	String provincia = cedula.substring(0, 2);
	switch(provincia) {
		case "01":
			provincia = "Azuay";
			break;
		case "02":
			provincia = "Bolivar";
			break;
		case "03":
			provincia = "Cañar";
			break;
		case "04":
			provincia = "Carchi";
			break;
		case "05":
			provincia = "Cotopaxi";
			break;
		case "06":
			provincia = "Chimborazo";
			break;
		case "07":
			provincia = "El Oro";
			break;
		case "08":
			provincia = "Esmeraldas";
			break;
		case "09":
			provincia = "Guayas";
			break;
		case "10":
			provincia = "Imbabura";
			break;
		case "11":
			provincia = "Loja";
			break;
		case "12":
			provincia = "Los Ríos";
			break;
		case "13":
			provincia = "Manabí";
			break;
		case "14":
			provincia = "Morona Santiago";
			break;
		case "15":
			provincia = "Napo";
			break;
		case "16":
			provincia = "Pastaza";
			break;
		case "17":
			provincia = "Pichincha";
			break;
		case "18":
			provincia = "Tungurahua";
			break;
		case "19":
			provincia = "Zamora Chinchipe";
			break;
		case "20":
			provincia = "Galápagos";
			break;
		case "21":
			provincia = "Sucumbíos";
			break;
		case "22":
			provincia = "Orellana";
			break;
		case "23":
			provincia = "Santo Domingo de los Tsáchilas";
			break;
		case "24":
			provincia = "Santa Elena";
			break;
		case "30":
			provincia = "Número reservado para ecuatorianos en el exterior";
			break;
		default:
			provincia = "Provincia desconocida";
				break;
	}
	%>
	<strong>Clave: </strong><%=clave %>
	<br>
	<strong>Cédula: </strong><%=cedula %>
	<br>
	<strong>Provincia de obtención: </strong> <%=provincia %>
	</br>
	<strong>Vive en el: </strong> <%=residencia %>
	</br><strong>Estado Civil: </strong> <%=estadoCivil %> </br>
	<strong>Foto: </strong> <u><%=foto %></u>
	<br>
	<strong>Hoja de Vida: </strong> <u><%=hojadevida %></u>
	<br>
	<strong>Año y mes de nacimiento: </strong> <span><% out.print(request.getParameter("fecha")); %></span>
	</br>
	<%
	String fechaNacimientoStr = request.getParameter("fecha");
  	DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
  	Date fechaNacimiento = format.parse(fechaNacimientoStr);
  	Calendar fechaNacimientoCalendar = Calendar.getInstance();
  	fechaNacimientoCalendar.setTime(fechaNacimiento);
  	Calendar fechaActual = Calendar.getInstance();
  	int anios = fechaActual.get(Calendar.YEAR) - fechaNacimientoCalendar.get(Calendar.YEAR);
  	if (fechaActual.get(Calendar.MONTH) < fechaNacimientoCalendar.get(Calendar.MONTH)) {
      anios--;
  	} else if (fechaActual.get(Calendar.MONTH) == fechaNacimientoCalendar.get(Calendar.MONTH)
              && fechaActual.get(Calendar.DAY_OF_MONTH) < fechaNacimientoCalendar.get(Calendar.DAY_OF_MONTH)) {
      anios--;
  	}
  	out.print("<strong> Edad: </strong>" + anios);
	%>
	</br><strong>Mi color favorito es: </strong> <%=color %>
	</br><font color=<%=color%>> Este es tu color favorito</font>
	</div>
	<br>
</body>
</html>
