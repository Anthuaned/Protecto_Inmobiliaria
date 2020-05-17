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
public class clsServicio {
    clsJDBC objConectar = new clsJDBC();
    String strSQL;
    ResultSet rs = null;
    
    /*
    
      CREATE TABLE TIPOSERVICIO (
      idTIPOSERVICIO SERIAL NOT NULL PRIMARY KEY,
      nombre VARCHAR(45) NOT NULL);

      CREATE TABLE SERVICIO (
      idSERVICE SERIAL NOT NULL PRIMARY KEY,
      fecha DATE NOT NULL,
      total DECIMAL(8,2) NOT NULL,
      igv DECIMAL(8,2) NOT NULL,
      subtotal DECIMAL(8,2) NOT NULL,
      CLIENTE_idCLIENTE INT NOT NULL REFERENCES CLIENTE,
      TIPOSERVICIO_idTIPOSERVICIO INT NOT NULL REFERENCES TIPOSERVICIO,
      PROPIEDAD_idPROPIEDAD INT NOT NULL REFERENCES PROPIEDAD);
    
    */
    
    
    public void registrarTiposervicio(String nombre) throws Exception{
        try {
            strSQL="insert into tiposervicio values(default,'"+nombre+"')";
            objConectar.ejecutarBD(strSQL);
        } catch (Exception e) {
            throw new Exception(e);
        }
    }
    
    public void registrarServicio(float total, float igv, float subtotal,int idcliente,int tiposervicio, int propiedad)throws Exception{
        try {
            strSQL="insert into propiedad values(default,current_date,"+total+","+igv+","+subtotal+","+idcliente+","+tiposervicio+","+propiedad+")";
            objConectar.ejecutarBD(strSQL);
        } catch (Exception e) {
             throw new Exception(e);
        }
    }
    
}
