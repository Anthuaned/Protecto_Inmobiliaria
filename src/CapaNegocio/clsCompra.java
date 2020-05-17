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
public class clsCompra {
    
    clsJDBC objConectar = new clsJDBC();
    String strSQL;
    ResultSet rs = null;
    
    /*
      CREATE TABLE COMPRA (
      idSHOP SERIAL NOT NULL PRIMARY KEY,
      fecha DATE NOT NULL,
      precio DECIMAL(8,2) NOT NULL,
      PROVEEDOR_idPROVEEDOR INT NOT NULL REFERENCES PROVEEDOR,
      PROPIEDAD_idPROPIEDAD INT NOT NULL REFERENCES PROPIEDAD);
    */
    
    public void registarCompra(float precio,int idproveedor, int idpropiedad)throws Exception{
        
        strSQL="insert into compra values (default,current_date, "+idproveedor+","+idpropiedad+")";
        try {
            objConectar.ejecutarBD(strSQL);
        } catch (Exception e) {
            throw new Exception(e);
        }
    }
    
}
