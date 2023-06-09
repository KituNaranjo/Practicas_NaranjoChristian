<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.productos.negocio.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet" type="text/css">
<link href="css/estilos.css" rel="stylesheet" type="text/css">
<title>Eliminar Productos</title>
<script>
    function confirmarEliminar() {
        return confirm("�Est�s seguro de que deseas eliminar este producto?");
    }
</script>
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
    <div align="center" style="padding: 40px;">
        <% String usuario;
        HttpSession sesion = request.getSession();
        if (sesion.getAttribute("usuario") == null) { %>
            <jsp:forward page="login.jsp">
            <jsp:param name="error" value="Debe registrarse"/>
            </jsp:forward>
        <% } else {
            usuario=(String)sesion.getAttribute("usuario"); 
            int perfil=(Integer)sesion.getAttribute("perfil"); %>
            <h3 class="title">Eliminar Producto</h3>
            <% out.println(usuario); %>
            <% int cod = Integer.parseInt(request.getParameter("cod"));
            Producto mp = new Producto(); %>
            <script>
                if (confirmarEliminar()) {
                    <% boolean f = mp.EliminarProducto(cod); %>
                    <% if(f == true) { %>
                        window.location.href = "productos.jsp";
                    <% } %>
                } else {
                }
            </script>
        <% } %>
    </div>
</main>
</body>
</html>
