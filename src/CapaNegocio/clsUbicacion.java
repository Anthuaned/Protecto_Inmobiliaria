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
public class clsUbicacion {
    clsJDBC objConectar = new clsJDBC();
    String strSQL;
    ResultSet rs = null;
    
    /*
      CREATE TABLE PAIS (
      idPAIS SERIAL NOT NULL PRIMARY KEY,
      nombre VARCHAR(45) NULL);

      CREATE TABLE DEPARTAMENTO (
      idDEPARTAMENTO SERIAL NOT NULL PRIMARY KEY,
      nombre VARCHAR(45) NULL,
      PAIS_idPAIS INT NOT NULL REFERENCES PAIS); 

      CREATE TABLE PROVINCIA (
      idPROVINCIA INT NOT NULL PRIMARY KEY,
      nombre VARCHAR(45) NOT NULL,
      DEPARTAMENTO_idDEPARTAMENTO INT NOT NULL REFERENCES DEPARTAMENTO);
    
      CREATE TABLE DISTRITO (
      idDISTRITO SERIAL NOT NULL  PRIMARY KEY,
      nombre VARCHAR(45) NOT NULL,
      PROVINCIA_idPROVINCIA INT NOT NULL REFERENCES PROVINCIA)
    ;
    
    */
    
    
    public void registrarPais(String nombre)throws Exception{
        try {
            strSQL="insert into pais values (default,'"+nombre+"')";
            objConectar.ejecutarBD(strSQL);
        } catch (Exception e) {
             throw new Exception(e);
        }
    }
    
    public void registrarDepartamento(String nombre, int pais)throws Exception{
        try {
            strSQL="insert into departamento values (default,'"+nombre+"', "+pais+")";
            objConectar.ejecutarBD(strSQL);
        } catch (Exception e) {
             throw new Exception(e);
        }
    }
    
    public void registrarProvincia(String nombre, int departamento)throws Exception{
        try {
            strSQL="insert into pais values (default,'"+nombre+"',"+departamento+")";
            objConectar.ejecutarBD(strSQL);
        } catch (Exception e) {
             throw new Exception(e);
        }
    }
    
    
    public void registrarDsitrito(String nombre, int provincia)throws Exception{
        try {
            strSQL="insert into pais values (default,'"+nombre+"',"+provincia+")";
            objConectar.ejecutarBD(strSQL);
        } catch (Exception e) {
             throw new Exception(e);
        }
    }
    
}
