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
public class clsUsuario {
   
    clsJDBC objConectar = new clsJDBC();
    String strSQL;
    ResultSet rs = null;
    
    
    /*
      CREATE TABLE TIPOUSUARIO (
      idTIPOUSUARIO INT NOT NULL PRIMARY KEY,
      nombrecargo VARCHAR(45) NOT NULL);
    
      CREATE TABLE USUARIO (
      idUSUARIO INT NOT NULL PRIMARY KEY,
      nombreusuario VARCHAR(45) NOT NULL,
      nombre VARCHAR(45) NOT NULL,
      apellido VARCHAR(45) NOT NULL,
      correo VARCHAR(45) NOT NULL,
      telefono VARCHAR(14) NOT NULL,
      direccion VARCHAR(45) NOT NULL,
      fecha_nacimiento DATE NOT NULL,
      pregunta VARCHAR(45) NOT NULL,
      respuesta VARCHAR(45) NOT NULL,
      contraseña VARCHAR(45) NOT NULL,
      estado BOOLEAN NOT NULL,
      TIPOUSUARIO_idTIPOUSUARIO INT NOT NULL REFERENCES TIPOUSUARIO);
    */
    
    public String login(String usu, String con) throws Exception{
        strSQL = "select nombre,apellido from usuario " + 
                "where nombreusuario='" + usu + "' and contraseña='" + con + "' and estado=true";
        String nombre;
        String apellido;
        try {
            rs = objConectar.consultarBD(strSQL);
            while( rs.next() ){
                nombre=rs.getString("nombre");
                apellido = rs.getString("apellido");
                return nombre+""+apellido;
            }
        } catch (Exception e) {
            throw new Exception(e);
        }
        return "";
    }
    
    
    
    public int validarRespuesta(String usu, String respuesta) throws Exception{
        strSQL = "select count(*) as valor from usuario where nombreusuario='"+usu+"' and respuesta='"+respuesta+"' ";
        try {
            rs= objConectar.consultarBD(strSQL);
            return rs.getInt("valor");
            
        } catch (Exception e) {
            throw new Exception(e);
        }
    }
   
   public ResultSet listarUsuarios() throws Exception{
       strSQL = "select * from usuario";
       try {
           rs=objConectar.consultarBD(strSQL);
           return rs;
       } catch (Exception e) {
           throw new Exception(e);
       }
   }
   
   public void registrarUsuario(String nombreusuario, String nombre, String apellido, String correo, String telefono, String direccion, String fecha_nacimiento,String pregunta, String respuesta, String contraseña, Boolean estado) throws Exception {
       try {
           strSQL ="insert into usuario values(default,'"+nombreusuario+"','"+nombre+"','"+apellido+"','"+correo+"','"+telefono+"','"+direccion+"','"+fecha_nacimiento+"','"+pregunta+"','"+pregunta+"','"+respuesta+"','"+contraseña+"',"+estado+")";
           objConectar.ejecutarBD(strSQL);
       } catch (Exception e) {
       }
   }
   
   public void darBajaUsuario(String nombreusuario) throws Exception{
       try {
           strSQL="update usuario set estado=false where nombreusuario='"+nombreusuario+"'";
           objConectar.ejecutarBD(strSQL);
       } catch (Exception e) {
           throw new Exception(e);
       }
   }
   
    public void eliminarUsuario(String nombreusuario) throws Exception{
       try {
           strSQL="delete from usuario where nombreusuario='"+nombreusuario+"'";
           objConectar.ejecutarBD(strSQL);
       } catch (Exception e) {
           throw new Exception(e);
       }
   }
    
}
