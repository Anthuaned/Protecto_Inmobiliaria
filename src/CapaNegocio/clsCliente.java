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
public class clsCliente {
    clsJDBC objConectar = new clsJDBC();
    //String strSQL;
    ResultSet rs = null;
    Connection con;
    Statement sent;
    
    /*
      CREATE TABLE CLIENTE (
      idCLIENTE SERIAL NOT NULL PRIMARY KEY,
      dni_ruc VARCHAR(8) NOT NULL,
      nombre VARCHAR(45) NOT NULL,
      apellido VARCHAR(45) NOT NULL,
      correo VARCHAR(45) NOT NULL,
      telefono VARCHAR(14) NOT NULL,
      estado BOOLEAN NOT NULL);
    */
    
    public Integer generarCodigoCliente() throws Exception{
        try {
            objConectar.conectar();
            con = objConectar.getConnection();
            CallableStatement sentencia = con.prepareCall("SELECT COALESCE(max(idcliente),0)+1 AS codigo FROM cliente");
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
    
    public ResultSet listarCliente() throws Exception{
        try {
            objConectar.conectar();
            con = objConectar.getConnection();
            CallableStatement sentencia = con.prepareCall("SELECT*FROM cliente");
            ResultSet resultado = sentencia.executeQuery();
            return resultado;
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        }finally{
            objConectar.desconectar();
        }
    }
    
    public void registrarCliente(String documento,String nombre,String apellido,String correo,String telefono,Boolean estado) throws Exception{
        try {
            objConectar.conectar();
            con = objConectar.getConnection();
            CallableStatement sentencia = con.prepareCall("INSERT INTO cliente VALUES(default,?,?,?,?,?,?)");
            sentencia.setString(1, documento);
            sentencia.setString(2, nombre);
            sentencia.setString(3, apellido);
            sentencia.setString(4, correo);
            sentencia.setString(5, telefono);
            sentencia.setBoolean(6, estado);
            sentencia.executeUpdate();
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        }finally{
            objConectar.desconectar();
        }
    }
    
    
    public ResultSet buscarClientes(int idCliente) throws Exception{
        try {
            objConectar.conectar();
            con = objConectar.getConnection();
            CallableStatement sentencia = con.prepareCall("SELECT*FROM clientes WHERE idcliente=?");
            sentencia.setInt(1, idCliente);
            ResultSet resultado = sentencia.executeQuery();
            return resultado;
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        }finally{
            objConectar.desconectar();
        }
    }
    
    
    public void darBajaCliente(int idCliente) throws Exception{
        try {
            objConectar.conectar();
            con = objConectar.getConnection();
            CallableStatement sentencia = con.prepareCall("UPDATE cliente SET estado = false WHERE idcliente=?");
            sentencia.setInt(1,idCliente);
            sentencia.executeUpdate();
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        }finally{
            objConectar.desconectar();
        }
    }
    
    
    public void eliminarCliente(int idCliente) throws Exception{
        try {
            objConectar.conectar();
            con = objConectar.getConnection();
            CallableStatement sentencia = con.prepareCall("DELETE FROM cliente WHERE idcliente=?");
            sentencia.setInt(1,idCliente);
            sentencia.executeUpdate();
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        }finally{
            objConectar.desconectar();
        }
    }
    
    
    public void modificarCliente(int idCliente, String documento,String nombre,String apellido,String correo,String telefono,Boolean estado) throws Exception{
        try {
            objConectar.conectar();
            con = objConectar.getConnection();
            CallableStatement sentencia = con.prepareCall("UPDATE cliente SET dni_ruc=?, nombre=?, apellido=?, correo=?, telefono=?, estado=? WHERE idcliente=?");
            sentencia.setString(1, documento );
            sentencia.setString(2, nombre);
            sentencia.setString(3, apellido);
            sentencia.setString(4, correo);
            sentencia.setString(5, telefono);
            sentencia.setBoolean(6, estado);
            sentencia.setInt(7, idCliente);
            sentencia.executeUpdate();
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        }finally{
            objConectar.desconectar();
        }
    }
 
    
}
