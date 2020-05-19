/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CapaNegocio;

import CapaDatos.clsJDBC;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 *
 * @author user
 * Bravo Gonzales Anthuaned
 * Castro Fernández Paola 
 * Falla Pisfil Daniel
 * Ruiz Correa Cristhian
 */
public class clsProveedor {
    clsJDBC objConectar = new clsJDBC();
    String strSQL;
    ResultSet rs = null;
    Connection con;
    Statement sent;
    
    /*
      CREATE TABLE TIPOPROVEEDOR (
      idTIPOPROVEEDOR SERIAL NULL PRIMARY KEY,
      nombre VARCHAR(45) NOT NULL);
    
      CREATE TABLE PROVEEDOR (
      idPROVEEDOR SERIAL NULL PRIMARY KEY,
      nombre VARCHAR(45) NOT NULL,
      apellido VARCHAR(45) NOT NULL,
      telefono VARCHAR(45) NOT NULL,
      correo VARCHAR(45) NOT NULL,
      direccion VARCHAR(45) NOT NULL,
      TIPOPROVEEDOR_idTIPOPROVEEDOR INT NOT NULL REFERENCES TIPOPROVEEDOR);

    */
    
    public ResultSet listarTipoProveedor() throws Exception{
        try {
            objConectar.conectar();
            con = objConectar.getConnection();
            CallableStatement sentencia = con.prepareCall("SELECT*FROM tipoproveedor");
            ResultSet resultado = sentencia.executeQuery();
            return resultado;
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        }finally{
            objConectar.desconectar();
        }
    }
    
    public int obtenerTipoProveedor(String nombre) throws Exception{
        try {
            objConectar.conectar();
            con = objConectar.getConnection();
            CallableStatement sentencia = con.prepareCall("SELECT idproveedor FROM tipoproveedor WHERE nombre=?");
            sentencia.setString(1,nombre);
            ResultSet resultado = sentencia.executeQuery();
            if (resultado.next()) return resultado.getInt("idproveedor");
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        }finally{
            objConectar.desconectar();
        }
        return 0;
    }
    
    public String obtenerTipoProveedorNombre(int id) throws Exception{
        try {
            objConectar.conectar();
            con = objConectar.getConnection();
            CallableStatement sentencia = con.prepareCall("SELECT nombre FROM tipoproveedor WHERE idtipoproveedor=?");
            sentencia.setInt(1,id);
            ResultSet resultado = sentencia.executeQuery();
            if (resultado.next()) return resultado.getString("nombre");
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        }finally{
            objConectar.desconectar();
        }
        return null;
    }
    
    public Integer generarCodigoProveedor() throws Exception{
        try {
            objConectar.conectar();
            con = objConectar.getConnection();
            CallableStatement sentencia = con.prepareCall("SELECT COALESCE(max(idproveedor),0)+1 AS codigo FROM proveedor");
            ResultSet resultado = sentencia.executeQuery();
            while (resultado.next()){
               return resultado.getInt("codigo"); 
            }
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        }finally{
            objConectar.desconectar();
        }
        return 0;
    }
    
    public ResultSet listarProveedor() throws Exception{
        try {
            objConectar.conectar();
            con = objConectar.getConnection();
            CallableStatement sentencia = con.prepareCall("SELECT*FROM proveedor");
            ResultSet resultado = sentencia.executeQuery();
            return resultado;
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        }finally{
            objConectar.desconectar();
        }
    }
    
    
    public void registrarProveedor(String nombre,String apellido,String telefono,String correo,String direccion, int tipoProveedor) throws Exception{
        try {
            objConectar.conectar();
            con = objConectar.getConnection();
            CallableStatement sentencia = con.prepareCall("INSERT INTO proveedor VALUES(default,?,?,?,?,?,?)");
            sentencia.setString(1, nombre);
            sentencia.setString(2, apellido);
            sentencia.setString(3, telefono);
            sentencia.setString(4, correo);
            sentencia.setString(5, direccion);
            sentencia.setInt(6, tipoProveedor);
            sentencia.executeUpdate();
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        }finally{
            objConectar.desconectar();
        }
    }
    
    
    public ResultSet buscarProveedor(int idProveedor) throws Exception{
        try {
            objConectar.conectar();
            con = objConectar.getConnection();
            CallableStatement sentencia = con.prepareCall("SELECT*FROM proveedor WHERE idproveedor=?");
            sentencia.setInt(1, idProveedor);
            ResultSet resultado = sentencia.executeQuery();
            return resultado;
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        }finally{
            objConectar.desconectar();
        }
    }
  
    
    public void eliminarProveedor(int idProveedor) throws Exception{
        try {
            objConectar.conectar();
            con = objConectar.getConnection();
            CallableStatement sentencia = con.prepareCall("DELETE FROM proveedor WHERE idProveedor=?");
            sentencia.setInt(1,idProveedor);
            sentencia.executeUpdate();
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        }finally{
            objConectar.desconectar();
        }
    }
    
    
    public void modificarProveedor(String nombre,String apellido,String telefono,String correo,String direccion, int tipoProveedor, int idProveedor) throws Exception{
        try {
            objConectar.conectar();
            con = objConectar.getConnection();
            CallableStatement sentencia = con.prepareCall("UPDATE proveedor SET nombre=?, apellido=?, telefono=?, correo=?, direccion=?, tipoproveedor_idtipoproveedor? WHERE idproveedor=?");
            sentencia.setString(1, nombre );
            sentencia.setString(2, apellido );
            sentencia.setString(3, telefono );
            sentencia.setString(4, correo);
            sentencia.setString(5, direccion);
            sentencia.setInt(6, tipoProveedor);
            sentencia.setInt(7, idProveedor);
            sentencia.executeUpdate();
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        }finally{
            objConectar.desconectar();
        }
    }
    
}
