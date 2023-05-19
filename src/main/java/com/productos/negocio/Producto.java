package com.productos.negocio;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.io.File;
import java.io.FileInputStream;

import com.productos.datos.Conexion;
public class Producto {
	private int id;
	private String nombre;
	private int cantidad;
	private double precio;
	private byte foto;
	private int cat;
	
	public int getId() {
		return id;
		}
	
	public void setId(int id) {
		this.id = id;
		}
	
	public String getNombre() {
		return nombre;
		}
	
	public void setNombre(String nombre) {
		this.nombre = nombre;
		}
	
	public int getCantidad() {
		return cantidad;
		}
	
	public void setCantidad(int cantidad) {
		this.cantidad = cantidad;
		}
	
	public double getPrecio() {
		return precio;
		}
	
	public void setPrecio(double precio) {
		this.precio = precio;
		}
	
	public int getCat() {
		return cat;
		}
	
	public void setCat(int cat) {
		this.cat = cat;
		}
	
	public byte getFoto() {
		return foto;
		}
	
	public void setFoto(byte foto) {
		this.foto = foto;
		}
	
	public Producto() {
		this.cantidad=0;
		this.foto=0;
		this.id=0;
		this.nombre="";
		this.precio=0.0;
	}
	
	public String consultarTodo() {
		String sql="SELECT * FROM tb_producto ORDER BY id_pr";
		Conexion con=new Conexion();
		String tabla="<table border=2><th>ID</th><th>Producto</th><th>Cantidad</th><th>Precio</th>";
		ResultSet rs=null;
		rs=con.Consulta(sql);
		try {
			while(rs.next()) {
				tabla+="<tr><td>"+rs.getInt(1)+"</td>"
				+ "<td>"+rs.getString(3)+"</td>"
				+ "<td>"+rs.getInt(4)+"</td>"
				+ "<td>"+rs.getDouble(5)+"</td>"
				+ "</td></tr>";
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		tabla+="</table>";
		return tabla;
	}
	
	public String buscarProductoCategoria(int cat) {
		String sentencia="SELECT nombre_pr, precio_pr FROM tb_producto WHERE id_cat="+cat;
		Conexion con=new Conexion();
		ResultSet rs=null;
		String resultado="<table border=3>";
		try {
			rs=con.Consulta(sentencia);
			while(rs.next()) {
				resultado+="<tr><td>"+ rs.getString(1)+"</td>" + "<td>"+rs.getDouble(2)+"</td></tr>";
				}
			resultado+="</table>";
			} catch(SQLException e) {
		}
			return resultado;
		}
	
	public String ingresarProducto(int id, int cat,String nombre, int cantidad, double precio, String directorio) {
		String result="";
		Conexion con=new Conexion();
		PreparedStatement pr=null;
		String sql="INSERT INTO public.tb_producto " + "	(id_pr, id_cat, nombre_pr, cantidad_pr, precio_pr) " + "	VALUES (?, ?, ?, ?, ?);";
		try {
			pr=con.getConexion().prepareStatement(sql);
			pr.setInt(1,id);
			pr.setInt(2,cat);
			pr.setString(3, nombre);
			pr.setInt(4, cantidad);
			pr.setDouble(5, precio);
			//File fichero=new File(directorio);
			//FileInputStream streamEntrada=new FileInputStream(fichero);
			//pr.setBinaryStream(6, streamEntrada,(int)fichero.length());
			if(pr.executeUpdate()==1) {
				result="Inserción correcta";
				} else {
					result="Error en inserción";
					}
			} catch(Exception ex) {
				result=ex.getMessage();
				} finally 
		{ 
					try {
						pr.close();
						con.getConexion().close();
						} catch(Exception ex) {
							System.out.print(ex.getMessage());
							}
					}
		return result;
		}

	public String consultarProducto(int cod) {
		String tabla = "<table border=1>";
		String sql = "SELECT id_pr, nombre_pr, cantidad_pr, precio_pr"
				+ "	FROM public.tb_producto where id_cat = "+cod+";";
		ResultSet rs = null;
		tabla += "<tr>"
				+ "<th>Codigo</th>"
				+ "<th>Descripcion</th>"
				+ "<th>Precio</th>"
				+ "<th>Cantidad</th>"
				+ "</tr>";
		Conexion con=new Conexion();
		
			rs=con.Consulta(sql);
		try {
			while(rs.next()) {
				tabla += "<tr>"
						+ "<td><pre style=\"text-align: center\">"+rs.getInt(1)+"</pre></td>"
						+ "<td><pre style=\"text-align: center\">"+rs.getString(2)+"</pre></td>"
						+ "<td><pre style=\"text-align: center\">"+rs.getFloat(3)+"</pre></td>"
						+ "<td><pre style=\"text-align: center\">"+rs.getInt(4)+"</pre></td>"
						+ "<td><a href= BuscarProducto.jsp?cod="+rs.getInt(1)+"><pre style=\"text-align: center\">Modificar</pre></a></td>"
						+ "<td><a href= EliminarProducto.jsp?cod="+rs.getInt(1)+"><pre style=\"text-align: center\">Eliminar</pre></a></td>"
						+ "</tr>";
			}
			tabla += "</table>";
		} catch (SQLException e) {
			System.out.print(e.getMessage());
		}
		return tabla;
	}
	
	public void ConsulEditarProductos(int cod) {
		Conexion con=new Conexion();
		ResultSet rs = null;
		String sql = "SELECT id_pr, id_cat, nombre_pr, cantidad_pr, precio_pr"
				+ "	FROM public.tb_producto where id_pr ="+cod+";";
		rs=con.Consulta(sql);
		try {
		while(rs.next()) {
			setId(rs.getInt(1));
			setCat(rs.getInt(2));
			setNombre(rs.getString(3));
			setPrecio(rs.getFloat(5));
			setCantidad(rs.getInt(4));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public boolean ModificarProducto(Producto mp) {
		boolean agregado = false;
		Conexion con=new Conexion();
		String sql = "UPDATE tb_producto SET nombre_pr='" + mp.getNombre() + "', precio_pr=" + mp.getPrecio()+","
				+ " cantidad_pr=" + mp.getCantidad() + " WHERE id_pr=" + mp.getId() + ";";
		try {
			con.Ejecutar(sql);
			agregado = true;
		} catch (Exception e) {
			agregado = false;
		}
		return agregado;
	}
	
	public boolean EliminarProducto(int cod) {
		boolean f = false;
		Conexion con=new Conexion();
		String sql = "delete from tb_producto where id_pr=" + cod + ";";
		try {
			con.Ejecutar(sql);
			f = true;
		} catch (Exception e) {
			f = false;
		}
		return f;
	}
}
