<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" session="true" import="com.productos.seguridad.*"%>
<%
Usuario usuario=new Usuario();
String nlogin=request.getParameter("usuario");
String nclave=request.getParameter("clave");
HttpSession sesion=request.getSession();
boolean respuesta=usuario.verificarUsuario(nlogin,nclave);
if (respuesta) {
    sesion.setAttribute("usuario", usuario.getNombre()); 
    sesion.setAttribute("perfil", usuario.getPerfil()); 
    response.sendRedirect("menu.jsp"); 
} else {
%>
<jsp:forward page="login.jsp">
    <jsp:param name="error" value="Datos incorrectos.<br>Vuelva a intentarlo."/>
</jsp:forward>
<%
}
%>
