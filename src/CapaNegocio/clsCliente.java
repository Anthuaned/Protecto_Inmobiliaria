/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CapaNegocio;

import CapaDatos.clsJDBC;
import java.sql.ResultSet;

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
    String strSQL;
    ResultSet rs = null;
    
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
    
    public void registrarCliente(String documento,String nombre,String apellido,String correo,String telefono,Boolean estado) throws Exception{
        
        strSQL="insert into cliente values(default,'"+documento+"','"+nombre+"','"+apellido+"','"+correo+"','"+telefono+"', "+estado+")";
        try {
            objConectar.ejecutarBD(strSQL);
        } catch (Exception e) {
            throw new Exception(e);
        }
        
    }
    public ResultSet listarCliente() throws Exception{
        
        strSQL="select*from cliente";
        try {
            rs=objConectar.consultarBD(strSQL);
            return rs;
        } catch (Exception e) {
            throw new Exception(e);
        }
        
    }
    
    public void darBajaCliente(int idcliente) throws Exception{
        strSQL="update cliente set estado = true where idcliente="+idcliente+"";
        try {
            objConectar.ejecutarBD(strSQL);
        } catch (Exception e) {
            throw new Exception(e);
        }
        
    }
    public void eliminarCliente(int idcliente) throws Exception{
        
        strSQL="delete from cliente where idcliente="+idcliente+"";
        try {
            objConectar.ejecutarBD(strSQL);
        } catch (Exception e) {
            throw new Exception(e);
        }
        
    }
    
}
