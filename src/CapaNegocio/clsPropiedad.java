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
public class clsPropiedad {
    clsJDBC objConectar = new clsJDBC();
    String strSQL;
    ResultSet rs = null;
    
    /*
    
      CREATE TABLE TIPO (
      idTIPO SERIAL NOT NULL PRIMARY KEY ,
      nombre VARCHAR(45) NULL);

      CREATE TABLE PROPIEDAD (
      idPROPIEDAD INT NOT NULL PRIMARY KEY,
      area FLOAT NOT NULL,
      precio DECIMAL(8,2) NOT NULL,
      direccion VARCHAR(45) NOT NULL,
      TIPO_idTIPO INT NOT NULL REFERENCES TIPO,
      DISTRITO_idDISTRITO INT NOT NULL REFERENCES PROPIEDAD);
    
    */
    public void registrarTipoPropiedad(String nombre) throws Exception{
        try {
            strSQL="insert into tipo values(default,'"+nombre+"')";
            objConectar.ejecutarBD(strSQL);
        } catch (Exception e) {
            throw new Exception(e);
        }
    }
    
    public void registrarPropiedad(float area,float precio,String direccion, int tipo, int distrito) throws Exception{
        try {
            strSQL="insert into propiedad values (default,"+area+","+precio+",'"+direccion+"',"+tipo+","+distrito+")";
            objConectar.ejecutarBD(strSQL);
        } catch (Exception e) {
            throw new Exception(e);
        }
    }
    
}
