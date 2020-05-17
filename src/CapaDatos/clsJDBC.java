/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CapaDatos;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author user
 * Bravo Gonzales Anthuaned
 * Castro Fernández Paola 
 * Falla Pisfil Daniel
 * Ruiz Correa Cristhian
 */
public class clsJDBC {
    
    
     private String driver, url,user,password;
    private Connection con;
    private Statement sent=null;
    
    
     //Constructor
    public clsJDBC() {
        this.driver = "org.postgresql.Driver";
        this.url = "jdbc:postgresql://localhost:5432/BDInmobiliaria"; 
        this.user = "postgres";
        //cambiar contraseña
        this.password = "123456789";
        this.con = null;
    } 
    
    //Conectar
    public void conectar() throws Exception{
        try{
           Class.forName(driver);
           con=DriverManager.getConnection(url, user, password);
        }catch(ClassNotFoundException | SQLException ex){
            throw new Exception("Error al conectar a la Base de Datos!");
        }
    }
    //Desconectar
    public void desconectar() throws Exception{
        try{
           con.close();
        } catch (SQLException ex) {
             throw new Exception("Error al desconectar de la BD!");
        }
    }
    
    //Ejecutar una consulta SELECT
    public ResultSet consultarBD (String strSQL) throws Exception{
        ResultSet rs=null;
        try {
            conectar();
            sent = con.createStatement();
            rs = sent.executeQuery(strSQL);
            return rs;
        } catch (Exception e) {
            throw new Exception("Error al ejecutar consulta");
        } finally{
            if (con != null){
                desconectar();
            }
        }
    }
    
    public void ejecutarBD (String strSQL) throws Exception{
        ResultSet rs=null;
        try {
            conectar();
            sent = con.createStatement();
            sent.executeUpdate(strSQL);
        } catch (Exception e) {
            throw new Exception("Error al ejecutar consulta");
        } finally{
            if (con != null){
                desconectar();
            }
        }
    }
    
}
