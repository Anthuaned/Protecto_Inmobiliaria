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
public class clsProveedor {
    clsJDBC objConectar = new clsJDBC();
    String strSQL;
    ResultSet rs = null;
    
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
    
}
