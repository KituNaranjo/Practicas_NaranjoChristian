package com.productos.seguridad;

import java.sql.ResultSet;
import com.productos.datos.*;

public class Usuario {
	private String nombre;
	private String direccion;
	private String login;
	private String clave;
	private Integer perfil;
	
public String getNombre(){
	return nombre;
}

public void setNombre(String nombre) {
	this.nombre = nombre;
}

public String getDireccion() {
	return direccion;
}

public void setDireccion(String direccion) {
	this.direccion = direccion;
}

public String getLogin() {
	return login;
}

public void setLogin(String login) {
	this.login = login;
}

public String getClave() {
	return clave;
}

public void setClave(String clave) {
	this.clave = clave;
}

public Integer getPerfil() {
	return perfil;
}

public void setPerfil(Integer perfil) {
	this.perfil = perfil;
}

public boolean cambiarClave(String nlogin, String nclave, String nuevaContrasena) {
    boolean respuesta = false;
    String sentencia = "SELECT * FROM tb_usuario WHERE login_us='" + nlogin +
            "' AND clave_us='" + nclave + "';";
    try {
        ResultSet rs;
        Conexion clsCon = new Conexion();
        rs = clsCon.Consulta(sentencia);
        if (rs.next()) {
            String actualizacion = "UPDATE tb_usuario SET clave_us = '" + nuevaContrasena + "' WHERE login_us = '" + nlogin + "';";
            clsCon.Ejecutar(actualizacion);
            respuesta = true;
        } else {
            respuesta = false;
            rs.close();
        }
    } catch (Exception ex) {
        System.out.println(ex.getMessage());
    }
    return respuesta;
}

public boolean verificarUsuario(String nlogin, String nclave) {
	boolean respuesta=false;
	String sentencia= "Select * from tb_usuario where login_us='"+nlogin+"' and clave_us='"+nclave+"';";
	try {
		ResultSet rs;
		Conexion clsCon=new Conexion();
		rs=clsCon.Consulta(sentencia);
		if(rs.next()) {
			respuesta=true;
			this.setLogin(nlogin);
			this.setClave(nclave);
			this.setPerfil(rs.getInt(2));
			this.setNombre(rs.getString(3));
			} else {
				respuesta=false;
				rs.close();
				}
		} catch(Exception ex) {
			System.out.println(ex.getMessage());
			}
	return respuesta;
	}
}